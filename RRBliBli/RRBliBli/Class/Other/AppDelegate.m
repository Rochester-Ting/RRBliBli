//
//  AppDelegate.m
//  RRBliBli
//
//  Created by 丁瑞瑞 on 23/6/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "AppDelegate.h"
#import "RRMainViewController.h"
@interface AppDelegate ()
/** 启动图片*/
@property (nonatomic,strong) UIImageView *bgImageView;
/** 动画效果*/
@property (nonatomic,strong) UIImageView *iconImageView;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    创建窗口window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    设置窗口的跟控制器
    self.window.rootViewController = [[RRMainViewController alloc] init];
    [self.window makeKeyAndVisible];
//    设置启动图片
    [self addStartIcon];
    return YES;
}
- (void)addStartIcon{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _bgImageView = [[UIImageView alloc] init];
    _bgImageView.frame = [UIScreen mainScreen].bounds;
    _bgImageView.image = [UIImage imageNamed:@"bilibili_splash_iphone_bg"];
    [window addSubview:self.bgImageView];
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 7.5, [UIScreen mainScreen].bounds.size.height/2 - 100, 30, 40)];
    _iconImageView.image = [UIImage imageNamed:@"bilibili_splash_default"];
    [window addSubview:self.iconImageView];
    [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//        _iconImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        _iconImageView.layer.transform = CATransform3DScale(CATransform3DIdentity, 10.0f, 10.0f, 10.0f);
    } completion:^(BOOL finished) {
        [_iconImageView removeFromSuperview];
        [_bgImageView removeFromSuperview];
    }];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
