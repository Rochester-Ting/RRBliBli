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
#import "UIView+Frame.h"
@interface RRMainViewController ()<UIScrollViewDelegate>
/** dhView*/
@property (nonatomic,strong) UIView *dhView;
/** 选中状态下的按钮*/
@property (nonatomic,strong) UIButton *selectedBtn;
/** 红色的线*/
@property (nonatomic,strong) UIView *lineView;
/** 滚动区域*/
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation RRMainViewController
- (UIButton *)selectedBtn
{
    if (!_selectedBtn) {
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _selectedBtn;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
//    添加子控制器
    [self addChildVC];
//    设置背景颜色
    [self setBackgroundColor];
//    设置滚动View
    [self setGDView];
//    设置导航View
    [self setDHView];
//    设置导航View里面的
    [self setDHViewWithBtn];
//    设置添加子控制器
    [self addView];
}
- (void)setGDView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    scrollView.contentSize = CGSizeMake(3 * [UIScreen mainScreen].bounds.size.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    self.scrollView = scrollView;
}
- (void)setDHView{
    UIView *dhView = [[UIView alloc] init];
    dhView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44);
    self.dhView = dhView;
    [self.view addSubview:dhView];
}
- (void)setDHViewWithBtn{
    NSArray *arrM = @[@"番剧",@"舞蹈",@"音乐"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arrM[i] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.frame = CGRectMake(i * [UIScreen mainScreen].bounds.size.width / 3, 0, [UIScreen mainScreen].bounds.size.width / 3, 43);
//        监听btn的点击
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        if (btn.tag == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
//            创建lineView
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = self.selectedBtn.titleLabel.textColor;
            [btn.titleLabel sizeToFit];
            lineView.rr_y = btn.rr_height;
            lineView.rr_width = btn.titleLabel.rr_width;
            lineView.rr_height = 1;
            lineView.rr_centerX = self.selectedBtn.rr_centerX;
            self.lineView = lineView;
            [self.dhView addSubview:lineView];
        }
        [self.dhView addSubview:btn];
    }
}
#pragma mark - 监听btn的点击
- (void)BtnClick:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation(btn.tag * [UIScreen mainScreen].bounds.size.width / 3, 0);
        [self.scrollView setContentOffset:CGPointMake(btn.tag * [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    }];
}
- (void)setBackgroundColor{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addChildVC{
    RRFJTableViewController *fjVC = [[RRFJTableViewController alloc] init];
    [self addChildViewController:fjVC];
    RRWDViewController *wdVC = [[RRWDViewController alloc] init];
    [self addChildViewController:wdVC];
    RRMusicViewController *musicVC = [[RRMusicViewController alloc] init];
    [self addChildViewController:musicVC];
}
- (void)addView{
//    取出滚动区域的长和宽
    CGFloat W = self.scrollView.rr_width;
    CGFloat H = self.scrollView.rr_height;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    计算当前索引
    NSInteger index = self.scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
//    取出当前的控制器
    UIViewController *vc = self.childViewControllers[index];
    if ([vc isViewLoaded]) {
        return;
    }
//    设置控制器的frame
    vc.view.frame = CGRectMake(W * index, 0, W, H);
    [self.scrollView addSubview:vc.view];
}
//当拖拽减速的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    获取当前索引
    int index = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
//    获取第几个按钮
    UIButton *btn = self.dhView.subviews[index+1];
    [self BtnClick:btn];
    [self addView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self addView];
}
@end
