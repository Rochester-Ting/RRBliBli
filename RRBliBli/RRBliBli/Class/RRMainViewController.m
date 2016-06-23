//
//  RRMainViewController.m
//  RRBliBli
//
//  Created by 丁瑞瑞 on 23/6/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRMainViewController.h"
#import "RRFJTableViewController.h"
#import "RRWDViewController.h"
#import "RRMusicViewController.h"
#import "RRNavController.h"
@interface RRMainViewController ()

@end

@implementation RRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
//    添加子控制器
    [self addChildVC];
}

- (void)addChildVC{
    RRFJTableViewController *fjVC = [[RRFJTableViewController alloc] init];
    [self addNavChild:fjVC];
    RRWDViewController *wdVC = [[RRWDViewController alloc] init];
    [self addNavChild:wdVC];
    RRMusicViewController *musicVC = [[RRMusicViewController alloc] init];
    [self addNavChild:musicVC];
}
- (void)addNavChild:(UIViewController *)vc{
    RRNavController *nav = [[RRNavController alloc] initWithRootViewController:vc];
//    vc.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:nav];
}
@end
