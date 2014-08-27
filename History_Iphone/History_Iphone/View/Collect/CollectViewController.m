//
//  CollectViewController.m
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectListTableViewCell.h"
#import "CollectManager.h"
#import "UIController.h"
#import "StoryViewController.h"

@interface CollectViewController ()

@end

@implementation CollectViewController

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
    self.navTitle = @"收藏列表";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[CollectManager shareInstance] getCollects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"CollectListTableViewCellIndentifier";
    CollectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CollectListTableViewCell" owner:self options:nil] lastObject];
    }
    CollectionEntity *entity = [[CollectManager shareInstance] getCollects][indexPath.row];
    DynastyStory *story = [[CollectManager shareInstance] getCollectedDynastyStory:entity.contentId];
    cell.strTitle = story.storyTitle;
    cell.strDate = entity.collectTime;
    if (indexPath.row == [[CollectManager shareInstance] getCollects].count-1) {
        cell.bLast = YES;
    }else{
        cell.bLast = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CollectionEntity *entity = [[CollectManager shareInstance] getCollects][indexPath.row];
    [[UIController shareInstance] setCurrentStoryId:entity.contentId];
    
    StoryViewController *storyVC = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
    [self.navigationController pushViewController:storyVC animated:YES];
}

@end
