//
//  PersonDetailViewController.m
//  History_Iphone
//
//  Created by zbq on 14-6-10.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "UIController.h"
#import "Contribute.h"
#import "Comment.h"

@interface PersonDetailViewController (){
    DynastyPersonDetail *personDetail;
    float fContributeHeight;
    float fCommentHeight;
}

- (void)loadIdCell;
- (void)loadHistoryContributeCell;
- (void)loadEvalution;

@end

@implementation PersonDetailViewController

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
    
    personDetail = [[UIController shareInstance] getPersonDetail];
    if (personDetail != nil) {
        self.navigationItem.title = personDetail.personName;
        [self loadIdCell];
        [self loadHistoryContributeCell];
        [self loadEvalution];
        [tableview reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadIdCell{
    lblName.text = personDetail.personName;
    lblGender.text = personDetail.gender;
    lblAddress.text = personDetail.address;
    lblCareer.text = personDetail.career;
    lblId.text = personDetail.idNumber;
    imageviewIcon.image = [UIImage imageNamed:personDetail.image];
}

- (void)loadHistoryContributeCell{
    float fYPosition = 11;
    NSSet *set = personDetail.contributes;
    for (Contribute *contribute in set) {
        CGSize size = [contribute.contributeContent sizeWithFont:[UIFont systemFontOfSize:17.0]
                               constrainedToSize:CGSizeMake(300, MAXFLOAT)
                                   lineBreakMode:NSLineBreakByTruncatingMiddle];
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, fYPosition, 300, size.height)];
        lbl.numberOfLines = 0;
        lbl.text = contribute.contributeContent;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor blackColor];
        [cellHistoryContribute addSubview:lbl];
        fYPosition += size.height+11;
    }
    fContributeHeight = fYPosition;
}

- (void)loadEvalution{
    float fHeight = 12;
    NSSet *set = personDetail.comments;
    for (Comment *comment in set) {
        CGSize size = [comment.commentContent sizeWithFont:[UIFont systemFontOfSize:17.0]
                                                constrainedToSize:CGSizeMake(300, MAXFLOAT)
                                                    lineBreakMode:NSLineBreakByTruncatingMiddle];
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, fHeight, 300, 47)];
        lbl.numberOfLines = 0;
        lbl.text = comment.commentContent;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor blackColor];
        [cellEvalution addSubview:lbl];
        fHeight += size.height+12;
    }
    fCommentHeight = fHeight;
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[UIController shareInstance] getSection].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeadInSection:(NSInteger)section{
    return 20.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = [UIColor clearColor];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 310, 20)];
    lbl.backgroundColor = [UIColor grayColor];
    lbl.textColor = [UIColor blackColor];
    lbl.text = [[[UIController shareInstance] getSection] objectAtIndex:section];
    [view addSubview:lbl];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 233;
        case 1:
            return fContributeHeight;
        case 2:
            return fCommentHeight;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return cellId;
        case 1:
            return cellHistoryContribute;
        case 2:
            return cellEvalution;
            
        default:
            break;
    }
    return nil;
}

@end
