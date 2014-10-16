//
//  UIController.m
//  History_Iphone
//
//  Created by zbq on 14-5-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "UIController.h"
#import "MakeData.h"
#import "DynastyList.h"
#import "DynastyStoryList.h"
#import "DynastyPersonList.h"
#import "DBHelper.h"

@interface UIController(private)
@property(nonatomic, strong) NSArray *_arrDynasties;
@end

@implementation UIController
@synthesize arrDynasties;
@synthesize storySearchWord;
@synthesize currentStoryId;
@synthesize personList;
@synthesize personListSiftCondition;
@synthesize personListSearchWord;
@synthesize currentPersonId;

+ (UIController *)shareInstance{
    static UIController *controller = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        controller = [[UIController alloc] init];
    });
    return controller;
}

- (NSArray *)arrDynasties{
    if (arrDynasties == nil || arrDynasties.count == 0) {
        NSArray *arrFromDB = [[UIController shareInstance] searchDynastyList];
        arrDynasties = [[NSArray alloc] initWithArray:arrFromDB];
    }
    return arrDynasties;
}

- (NSString *)getDynastyName:(NSString *)dynastyId{
    for (DynastyList *obj in self.arrDynasties) {
        if ([obj.dynastyId isEqualToString:dynastyId]) {
            return obj.dynastyName;
        }
    }
    return nil;
}

- (void)addDataToDB{
    [[MakeData shareInstance] createData];
}

- (NSArray *)searchDynastyList{
    return [[MakeData shareInstance] searchDynastyList];
}

#pragma mark - DynastyStory
- (NSArray *)getStoryTitles{
    return [[MakeData shareInstance] searchDynastyStoryList];
}

- (NSArray *)getStoriesDynastyList{
    if (self.storySearchWord.length == 0) {
        return [[UIController shareInstance] arrDynasties];
    }else{
        NSMutableArray *arrDynasty = [[NSMutableArray alloc] init];
        for (DynastyList *dynasty in [[UIController shareInstance] arrDynasties]) {
            if ([[UIController shareInstance] getStoriesByDynastyId:dynasty.dynastyId].count > 0) {
                [arrDynasty addObject:dynasty];
            }
        }
        return arrDynasty;
    }
}

- (NSArray *)getStoriesDynastyListByDynastyId:(NSString *)dynastyId{
    NSArray *arrTotalDynasties = [[UIController shareInstance] getStoriesDynastyList];
    if (dynastyId.length == 0) {
        return arrTotalDynasties;
    }else{
        NSMutableArray *arrSelectedDynasty = [[NSMutableArray alloc] init];
        for (DynastyList *dynasty in arrTotalDynasties) {
            if ([dynasty.dynastyId isEqualToString:dynastyId]) {
                [arrSelectedDynasty addObject:dynasty];
            }
        }
        return arrSelectedDynasty;
    }
}

- (NSArray *)getStoriesByDynastyId:(NSString *)dynastyId{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (DynastyStoryList *storyTitle in [[UIController shareInstance] getStoryTitles]) {
        if ([storyTitle.dynastyId isEqualToString:dynastyId]) {
            if (self.storySearchWord.length > 0) {//如果有查询条件
                NSRange range = [storyTitle.storyTitle rangeOfString:self.storySearchWord];
                if (range.length > 0) {
                    [arr addObject:storyTitle];
                }
            }else{
                [arr addObject:storyTitle];
            }
        }
    }
    return arr;
}

- (DynastyStory *)getStory{
    NSArray *arr = [[MakeData shareInstance] searchStoryByStoryId:currentStoryId];
    if (arr.count > 0) {
        return (DynastyStory *)arr[0];
    }
    return nil;
}

- (DynastyStory *)getStory:(NSString *)stroyId{
    NSArray *arr = [[MakeData shareInstance] searchStoryByStoryId:stroyId];
    if (arr.count > 0) {
        return (DynastyStory *)arr[0];
    }
    return nil;
}

#pragma mark - PersonList
- (void)clearSearchAndSift{
    personListSiftCondition = PersonListSiftNone;
    personListSearchWord = @"";
}

- (NSArray *)getAllPersonList{
    if (personList == nil) {
        NSArray *arr = [[MakeData shareInstance] searchPersonList];
        
        NSArray *sortedPerdonList = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            DynastyPersonList *person1 = (DynastyPersonList *)obj1;
            DynastyPersonList *person2 = (DynastyPersonList *)obj2;
            if ([person1.personId floatValue] < [person2.personId floatValue]) {
                return NSOrderedAscending;
            }
            if ([person1.personId floatValue] > [person2.personId floatValue]) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        
        personList = [[NSArray alloc] initWithArray:sortedPerdonList];
    }
    return personList;
}

- (NSArray *)getPersonDynastyList:(NSString *)searchword siftCondition:(PersonListSiftCondition)siftCondition{
    self.personListSearchWord = searchword;
    self.personListSiftCondition = siftCondition;
    NSMutableArray *arrPersonDynasty = [[NSMutableArray alloc] init];
    if (personListSiftCondition != PersonListSiftNone) {
        DynastyList *dl = [DBHelper insertObjectToEntity:@"DynastyPersonList"];//[[DynastyList alloc] init];
        dl.dynastyId = @"";//不显示section
        [arrPersonDynasty addObject:dl];
        return arrPersonDynasty;
    }else{
        //根据关键字查询
        NSArray *arrBySearchWord = [[UIController shareInstance] getPersonDynastyListBySearchWord];
        return arrBySearchWord;
    }
}

//根据搜索关键字判断该section是否有数据，返回数据
- (NSArray *)getPersonDynastyListBySearchWord{
    NSMutableArray *arrDynasty = [[NSMutableArray alloc] init];
    for (DynastyList *dynastyList in [[UIController shareInstance] arrDynasties]) {
        if ([[UIController shareInstance] getPersonListByDynastyId:dynastyList.dynastyId].count > 0) {
            [arrDynasty addObject:dynastyList];
        }
    }
    return arrDynasty;
}

//dynastyId下数据(包含搜索数据)
- (NSArray *)getPersonListByDynastyId:(NSString *)dynastyId{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (DynastyPersonList *personListItem in [[UIController shareInstance] getAllPersonList]) {
        if ([personListItem.dynastyId isEqualToString:dynastyId]) {
            if (self.personListSearchWord.length > 0) {
                NSRange range = [personListItem.personName rangeOfString:self.personListSearchWord];
                if (range.length > 0) {
                    [arr addObject:personListItem];
                }
            }else{
                [arr addObject:personListItem];
            }
        }
    }
    return arr;
}

- (DynastyPersonDetail *)getPersonDetail{
    NSArray *arr = [[MakeData shareInstance] searchPersonDetail:currentPersonId];
    if (arr.count > 0) {
        
        return (DynastyPersonDetail *)arr[0];
    }
    return nil;
}

//根据筛选条件选择数组
- (NSArray *)getPersonListBySiftCondition:(NSArray *)arrPersonList{
    if (personListSiftCondition == PersonListSiftNone) {
        return arrPersonList;
    }else if (personListSiftCondition == PersonListSiftFirstRole){
        NSMutableArray *arr= [[NSMutableArray alloc] init];
        for (DynastyPersonList *listItem in arrPersonList) {
            if (listItem.firstRole.length > 0) {
                [arr addObject:listItem];
            }
        }
        return arr;
    }else if (personListSiftCondition == PersonListSiftStartKing){
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (DynastyPersonList *listItem in arrPersonList) {
            if (listItem.startKing.length > 0) {
                [arr addObject:listItem];
            }
        }
        return arr;
    }else if (personListSiftCondition == PersonListSiftCommentCount){
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"commentCount" ascending:NO];
        NSArray *arr = [arrPersonList sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
        NSArray *arrSort = [[NSArray alloc] initWithArray:arr];
        return arrSort;
    }
    return nil;
}

//根据搜索关键字选择数据
- (NSArray *)getPersonListBySearchword{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (DynastyPersonList *personListItem in [[UIController shareInstance] getAllPersonList]) {
        if (self.personListSearchWord.length > 0) {
            NSRange range = [personListItem.personName rangeOfString:self.personListSearchWord];
            if (range.length > 0) {
                [arr addObject:personListItem];
            }
        }else{
            [arr addObject:personListItem];
        }
    }
    return arr;
}

- (NSArray *)getPersonList:(NSString *)dynastyId{
    if (personListSiftCondition != PersonListSiftNone || dynastyId.length == 0) {
        NSArray *arr = [[UIController shareInstance] getPersonListBySearchword];
        NSArray *arrResult = [[UIController shareInstance] getPersonListBySiftCondition:arr];
        return arrResult;
    }else{
        NSArray *arr = [[UIController shareInstance] getPersonListByDynastyId:dynastyId];
        return arr;
    }
}

- (NSArray *)getSection{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"身份证", @"历史贡献", @"后人评价", nil];
    return arr;
}

@end
