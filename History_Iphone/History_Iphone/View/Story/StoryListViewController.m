//
//  StoryListViewController.m
//  History_Iphone
//
//  Created by zbq on 14-5-28.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "StoryListViewController.h"
#import "UIController.h"
#import "DynastyList.h"
#import "StoryTitleTableViewCell.h"
#import "StoryViewController.h"

@interface StoryListViewController ()

@end

@implementation StoryListViewController

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
    self.navigationItem.title = @"历史故事";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - search delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    searchBar.showsCancelButton = YES;
    [[UIController shareInstance] setStorySearchWord:searchText];
    [tableStoryList reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    [[UIController shareInstance] setStorySearchWord:searchBar.text];
    [tableStoryList reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    [[UIController shareInstance] setStorySearchWord:nil];
    [tableStoryList reloadData];
}

#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[UIController shareInstance] getStoriesDynastyList].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyList][section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = [UIColor clearColor];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 310, 20)];
    lbl.backgroundColor = [UIColor grayColor];
    lbl.textColor = [UIColor blackColor];
    lbl.text = dynastyList.dynastyName;
    [view addSubview:lbl];
    return view;
}

//点击索引
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSInteger count = 0;
    for (DynastyList *dynastyList in [[UIController shareInstance] getStoriesDynastyList]) {
        if ([dynastyList.dynastyName isEqualToString:title]) {
            return count;
        }
        count ++;
    }
    return count;
}
//索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSArray *arrStoriesTitles = [[UIController shareInstance] getStoriesDynastyList];
    NSMutableArray *arrTitles = [[NSMutableArray alloc] initWithCapacity:arrStoriesTitles.count];
    for (DynastyList *dynastyList in arrStoriesTitles) {
        [arrTitles addObject:dynastyList.dynastyName];
    }
    return arrTitles;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyList][section];
    NSArray *arrStoroes = [[UIController shareInstance] getStoriesByDynastyId:dynastyList.dynastyId];
    return arrStoroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyList][indexPath.section];
    NSArray *arrStoroes = [[UIController shareInstance] getStoriesByDynastyId:dynastyList.dynastyId];
    
    static NSString *cellIndentifier = @"StoryTitleTableViewCellIndentifier";
    StoryTitleTableViewCell *cell = (StoryTitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"StoryTitleTableViewCell" owner:self options:nil];
        for (id nib in nibs) {
            if ([nib isKindOfClass:[StoryTitleTableViewCell class]]) {
                cell = nib;
            }
        }
    }
    cell.storyTitle = [arrStoroes objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyList][indexPath.section];
    NSArray *arrStoroes = [[UIController shareInstance] getStoriesByDynastyId:dynastyList.dynastyId];
    DynastyStoryList *entity = [arrStoroes objectAtIndex:indexPath.row];
    [[UIController shareInstance] setCurrentStoryId:entity.storyId];
    
    StoryViewController *storyVC = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
    [self.navigationController pushViewController:storyVC animated:YES];
    
}

@end
