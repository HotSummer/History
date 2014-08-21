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
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBarHidden = NO;
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 100, 44)];
    lbl.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"历史故事";
    lbl.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = lbl;
    
    [self loadDynastyCell];
    [self loadSearchView];
    tableStoryList.frame = CGRectMake(0, 98, 320, 470);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDynastyCell{
    NSArray *arrDynasties = [[UIController shareInstance] getStoriesDynastyList];
    
    CGFloat fTotalLength = 20;
    for (int i=0; i<arrDynasties.count+1; i++) {
        fTotalLength += 98;
    }
    fTotalLength += 15;
    
    DynastyCollectView *dynastyCollectView = [[DynastyCollectView alloc] initWithFrame:CGRectMake(0, 0, fTotalLength, 44)];
    dynastyCollectView.arrDynasties = arrDynasties;
    [scrollDynasty addSubview:dynastyCollectView];
    dynastyCollectView.delegate = self;
    [scrollDynasty setContentSize:CGSizeMake(fTotalLength, 42)];
    
    UILabel *lblSeparete = [[UILabel alloc] initWithFrame:CGRectMake(0, 44-thinLineHeight, 320, thinLineHeight)];
    lblSeparete.backgroundColor = [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0];
    [cellDynasty addSubview:lblSeparete];
    //    [tableStoryList reloadData];
}

- (void)loadSearchView{
    SearchView *searchView = [[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:self options:nil] lastObject];//[[SearchView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    searchView.frame = CGRectMake(0, 64, searchView.frame.size.width, searchView.frame.size.height);
    [self.view addSubview:searchView];
    searchView.delegate = self;
}

#pragma mark - SearchViewDelegate
- (void)search:(NSString *)searchContent{
    [[UIController shareInstance] setStorySearchWord:searchContent];
    [tableStoryList reloadData];
}

#pragma mark - DynastyCollectDelegate
- (void)didSelectedDynasty:(DynastyList *)dynasty{
    if (!dynasty) {
        [UIController shareInstance].selectedDynastyId = nil;
    }else{
        [UIController shareInstance].selectedDynastyId = dynasty.dynastyId;
    }
    [tableStoryList reloadData];
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
    return [[UIController shareInstance] getStoriesDynastyListByDynastyId:[UIController shareInstance].selectedDynastyId].count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyListByDynastyId:[UIController shareInstance].selectedDynastyId][section-1];
        NSArray *arrStoroes = [[UIController shareInstance] getStoriesByDynastyId:dynastyList.dynastyId];
        return arrStoroes.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return cellDynasty;
    }else{
        DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyListByDynastyId:[UIController shareInstance].selectedDynastyId][indexPath.section-1];
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
        if (indexPath.row == arrStoroes.count-1 && indexPath.section == [[UIController shareInstance] getStoriesDynastyListByDynastyId:[UIController shareInstance].selectedDynastyId].count) {
            cell.bLast = YES;
        }else{
            cell.bLast = NO;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section > 0) {
        DynastyList *dynastyList = (DynastyList *)[[UIController shareInstance] getStoriesDynastyListByDynastyId:[UIController shareInstance].selectedDynastyId][indexPath.section-1];
        NSArray *arrStoroes = [[UIController shareInstance] getStoriesByDynastyId:dynastyList.dynastyId];
        DynastyStoryList *entity = [arrStoroes objectAtIndex:indexPath.row];
        [[UIController shareInstance] setCurrentStoryId:entity.storyId];
        
        StoryViewController *storyVC = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
        [self.navigationController pushViewController:storyVC animated:YES];
    }
}

#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
