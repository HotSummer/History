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
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"人物故事";
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    self.navigationItem.leftBarButtonItem = leftBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressedBtnBack:(id)sender{
    [[UIController shareInstance] clearSearchAndSift];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didBeginPressedBtn:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [btn setTitleColor:[UIColor colorWithRed:42.0/255.0 green:121.0/255.0 blue:252.0/255.0 alpha:1.0] forState:UIControlStateNormal];
}

- (IBAction)didPressedBtn:(id)sender{
    UIButton *btnPressed = (UIButton *)sender;
    NSInteger iSelect = ((UIController *)[UIController shareInstance]).personListSiftCondition;
    if (iSelect != btnPressed.tag) {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[UIButton class]] && view.tag == iSelect) {
                UIButton *btn = (UIButton *)view;
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
        lblLine.frame = CGRectMake(btnPressed.tag*80, 150, 80, 2);
        ((UIController *)[UIController shareInstance]).personListSiftCondition = (PersonListSiftCondition)btnPressed.tag;
        [tableview reloadData];
    }
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:personListSearchBar.text siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
#warning fuck
    lblLine.frame = CGRectMake(((UIController *)[UIController shareInstance]).personListSiftCondition*80, 150, 80, 2);
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:personListSearchBar.text siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
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
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:personListSearchBar.text siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
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
    
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:personListSearchBar.text siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[indexPath.section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    DynastyPersonList *personListItem = arrPersonList[indexPath.row];
    cell.personList = personListItem;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [[UIController shareInstance] getPersonDynastyList:personListSearchBar.text siftCondition:((UIController *)[UIController shareInstance]).personListSiftCondition];
    DynastyList *dynastyList = arr[indexPath.section];
    
    NSArray *arrPersonList = [[UIController shareInstance] getPersonList:dynastyList.dynastyId];
    DynastyPersonList *personListItem = arrPersonList[indexPath.row];
    [[UIController shareInstance] setCurrentPersonId:personListItem.personId];
    PersonDetailViewController *personDetailVC = [[PersonDetailViewController alloc] init];
    [self.navigationController pushViewController:personDetailVC animated:YES];
}

#pragma mark - search delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    personListSearchBar.showsCancelButton = YES;
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    personListSearchBar.showsCancelButton = YES;
    [tableview reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    personListSearchBar.showsCancelButton = NO;
    [personListSearchBar resignFirstResponder];
    [tableview reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    personListSearchBar.showsCancelButton = NO;
    [personListSearchBar resignFirstResponder];
    [tableview reloadData];
}

@end
