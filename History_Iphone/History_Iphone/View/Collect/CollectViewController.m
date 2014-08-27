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
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationController.navigationBarHidden = NO;
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 100, 44)];
    lbl.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"收藏列表";
    lbl.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = lbl;
    
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
    return cell;
}

@end
