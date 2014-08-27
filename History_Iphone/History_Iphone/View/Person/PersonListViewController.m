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

@interface PersonListViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSearchView{
    SearchView *searchView = [[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:self options:nil] lastObject];
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
}

- (void)loadDynastyIndicatorView{
    DynastyIndicatorView *indicatorView = [[[NSBundle mainBundle] loadNibNamed:@"DynastyIndicatorView" owner:self options:nil] lastObject];
    [self.view addSubview:indicatorView];
    indicatorView.alpha = 0.9;
    indicatorView.frame = CGRectMake(271, 162, indicatorView.frame.size.width, indicatorView.frame.size.height);
}

- (IBAction)didPressedBtnBack:(id)sender{
    [[UIController shareInstance] clearSearchAndSift];
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[section];
    if (dynastyList.dynastyId.length == 0) {//不显示section view
        return nil;
    }else{
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        view.backgroundColor = [UIColor clearColor];
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 310, 20)];
        lbl.backgroundColor = [UIColor grayColor];
        lbl.textColor = [UIColor blackColor];
        lbl.text = dynastyList.dynastyName;
        [view addSubview:lbl];
        return view;
    }
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:searchText siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[indexPath.section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    DynastyPersonList *personListItem = arrPersonList[indexPath.row];
    [[UIController shareInstance] setCurrentPersonId:personListItem.personId];
    PersonDetailViewController *personDetailVC = [[PersonDetailViewController alloc] init];
    [self.navigationController pushViewController:personDetailVC animated:YES];
}

@end
