//
//  StoryViewController.m
//  History_Iphone
//
//  Created by zbq on 14-6-4.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "StoryViewController.h"
#import "UIController.h"

@interface StoryViewController ()

@end

@implementation StoryViewController

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
    DynastyStory *story = [[UIController shareInstance] getStory];
    self.navigationItem.title = story.storyTitle;
    
    ChapterView *chapterView = [[[NSBundle mainBundle] loadNibNamed:@"ChapterView" owner:self options:nil] lastObject];
    [self.view addSubview:chapterView];
    chapterView.frame = CGRectMake(0, 64, 320, 454);
    chapterView.strContent = story.storyContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSLayoutManagerDelegate
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
	return 25;//floorf(glyphIndex / 50);
}

@end
