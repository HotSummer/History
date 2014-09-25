//
//  PersonListViewController.m
//  History_Iphone
//
//  Created by zbq on 14-6-5.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PersonListViewController.h"
#import "UIController.h"
#import "DynastyList.h"
#import "PersonListTableViewCell.h"
#import "PersonDetailViewController.h"

@interface PersonListViewController (){
    NSMutableArray *arrDynastyLength;
}

- (void)loadDynastyLength;

@end

@implementation PersonListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navTitle = @"人物故事";
    searchText = @"";
    
    [self loadSearchView];
    [self loadCategoriesView];
    [self loadDynastyIndicatorView];
    [self loadDynastyLength];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timerAnimation invalidate];
}

- (void)loadSearchView{
    searchView = [[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:self options:nil] lastObject];
    searchView.frame = CGRectMake(0, 64, searchView.frame.size.width, searchView.frame.size.height);
    [self.view addSubview:searchView];
    searchView.delegate = self;
}

- (void)loadCategoriesView{
    HorizontalCollectView *horizontalCollectView = [[[NSBundle mainBundle] loadNibNamed:@"HorizontalCollectView" owner:self options:nil] lastObject];
    horizontalCollectView.frame = CGRectMake(0, 98, 320, 44);
    [self.view addSubview:horizontalCollectView];
    horizontalCollectView.arrData = @[@"历史首位", @"后人评论", @"开国之君"];
    horizontalCollectView.delegate = self;
    
    UILabel *lblSeparete = [[UILabel alloc] initWithFrame:CGRectMake(0, 44-thinLineHeight, 320, thinLineHeight)];
    lblSeparete.backgroundColor = [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0];
    [horizontalCollectView addSubview:lblSeparete];
}

- (void)loadDynastyIndicatorView{
    indicatorView = [[[NSBundle mainBundle] loadNibNamed:@"DynastyIndicatorView" owner:self options:nil] lastObject];
    
    indicatorView.alpha = 0.0;
    indicatorView.delegate = self;
    indicatorView.frame = CGRectMake(271, (iPhone5?224:182), indicatorView.frame.size.width, indicatorView.frame.size.height);
    
    [self.view addSubview:indicatorView];
}

- (void)hideIndicatorView{
    [UIView animateWithDuration:0.3 animations:^{
        indicatorView.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)loadDynastyLength{
    arrDynastyLength = [NSMutableArray array];
    CGFloat fHight = 0;
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    for (int i=0; i<arr.count; i++) {
        [arrDynastyLength addObject:[NSNumber numberWithFloat:fHight]];
        DynastyList *dynastyList = arr[i];
        NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
        fHight += arrPersonList.count*44;
    }
}

- (NSInteger)scrollToDynasty:(CGFloat)scrollContentOffset{
    int iDynasty=0;
    for (int i=0; i<arrDynastyLength.count-1; i++) {
        NSNumber *current = arrDynastyLength[i];
        NSNumber *next = arrDynastyLength[i+1];
        if (scrollContentOffset > [current floatValue] && scrollContentOffset <= [next floatValue]) {
            iDynasty = i;
            break;
        }
    }
    return iDynasty;
}

#pragma mark - HorizontalCollectViewDelegate
- (void)didSelected:(NSInteger)iSelected{
    NSInteger iPreSelect = ((UIController *)[UIController shareInstance]).personListSiftCondition;
    if (iPreSelect != iSelected) {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[UIButton class]] && view.tag == iPreSelect) {
                UIButton *btn = (UIButton *)view;
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
        ((UIController *)[UIController shareInstance]).personListSiftCondition = (PersonListSiftCondition)iSelected;
        [tableview reloadData];
    }
}

#pragma mark - SearchViewDelegate
- (void)search:(NSString *)searchContent{
    searchText = searchContent;
    [tableview reloadData];
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //没有搜索 没有筛选条件
    if (searchText.length == 0 && (((UIController *)[UIController shareInstance]).personListSiftCondition == PersonListSiftNone)) {
        if (timerAnimation) {
            [timerAnimation invalidate];
            timerAnimation = nil;
        }
        [UIView animateWithDuration:0.3 animations:^{
            indicatorView.alpha = 0.9;
        } completion:^(BOOL finished) {
            if (finished) {
                
            }
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (searchText.length == 0 && (((UIController *)[UIController shareInstance]).personListSiftCondition == PersonListSiftNone)) {
        NSInteger iDynasty = [self scrollToDynasty:scrollView.contentOffset.y];
        [indicatorView setCurrentIndex:iDynasty];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (searchText.length == 0 && (((UIController *)[UIController shareInstance]).personListSiftCondition == PersonListSiftNone)) {
        if (timerAnimation) {
            [timerAnimation invalidate];
            timerAnimation = nil;
        }
        timerAnimation = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hideIndicatorView) userInfo:nil repeats:NO];
    }
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    return arrPersonList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"PersonListTableViewCellIndentifier";
    PersonListTableViewCell *cell = (PersonListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PersonListTableViewCell" owner:self options:nil];
        for (id nib in nibs) {
            if ([nib isKindOfClass:[PersonListTableViewCell class]]) {
                cell = nib;
            }
        }
    }
    
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[indexPath.section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    DynastyPersonList *personListItem = arrPersonList[indexPath.row];
    cell.personList = personListItem;
    
    if (indexPath.section == arr.count-1 && indexPath.row == arrPersonList.count-1) {
        cell.bLast = YES;
    }else{
        cell.bLast = NO;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [searchView stopSearch];
    
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[indexPath.section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    DynastyPersonList *personListItem = arrPersonList[indexPath.row];
    [[UIController shareInstance] setCurrentPersonId:personListItem.personId];
    PersonDetailViewController *personDetailVC = [[PersonDetailViewController alloc] init];
    [self.navigationController pushViewController:personDetailVC animated:YES];
}

- (void)dealloc{
    timerAnimation = nil;
}

@end
