//
//  RRFJTableViewController.m
//  RRBliBli
//
//  Created by 丁瑞瑞 on 23/6/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRFJTableViewController.h"
#import "RRRefreshHeader.h"
#import "RRRefreshFooter.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "BannerItem.h"
@interface RRFJTableViewController ()
/** 请求管理者*/
@property (nonatomic,strong) AFHTTPSessionManager *manager;
/** 可变数组*/
@property (nonatomic,strong) NSMutableArray *bannerArrM;
@end

@implementation RRFJTableViewController

- (NSMutableArray *)bannerArrM
{
    if (!_bannerArrM) {
        _bannerArrM = [NSMutableArray array];
    }
    return _bannerArrM;
}
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
//    设置刷新 迁到
//    签到2222
    [self setRequest];
}
- (void)setRequest{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.manager GET:@"http://bangumi.bilibili.com/api/app_index_page_v2?access_key=20819ee9177d90bd7b07ca20b6bd6727&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3360&device=phone&platform=ios&sign=8b2717cac07eae922f8302eeefe7212a&ts=1465654494" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//1.MJExtension内部实现
//2.AFN和SDWebImage内部的多线程用NSOperation比较多
//3.

//- (void)setRefresh{
//    self.tableView.mj_header = [RRRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewMessage)];
//    [self.tableView.mj_header beginRefreshing];
//    self.tableView.mj_footer = [RRRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMessage)];
//}

//#pragma mark - loadNewMessage
//- (void)loadNewMessage{
//    
//}
//#pragma mark - loadMoreMessage
//- (void)loadMoreMessage{
//    
//}
//#pragma mark - datasource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 20;
//}
//UITableViewCell *cell;
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    cell = [tableView dequeueReusableCellWithIdentifier:@"RR"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RR"];
//    }
//    cell.textLabel.text = @"瑞瑞";
//    return cell;
//}

@end
