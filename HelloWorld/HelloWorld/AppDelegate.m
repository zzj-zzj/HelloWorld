//
//  AppDelegate.m
//  HelloWorld
//
//  Created by 许小六 on 2018/9/3.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <MJExtension.h>
#import <RongIMLib/RongIMLib.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[RCIM sharedRCIM] initWithAppKey:@"82hegw5u8y3rx"];
    [RCIM sharedRCIM].connectionStatusDelegate = self;
    [RCIM sharedRCIM].receiveMessageDelegate = self;
    [RCIM sharedRCIM].userInfoDataSource = self;
    
//    [[RCIMClient sharedRCIMClient] initWithAppKey:@"82hegw5u8y3rx"];
//    [RCIMClient sharedRCIMClient].logLevel = RC_Log_Level_Info;
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *naV = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = naV;
    [self.window makeKeyWindow];
    return YES;
}

- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    switch (status) {
        case ConnectionStatus_UNKNOWN:
            NSLog(@"未知状态:建立连接中出现异常的临时状态，SDK会做好自动重连，开发者无须处理");
            break;
        case ConnectionStatus_Connected:
            NSLog(@"连接成功");
            break;
        case ConnectionStatus_NETWORK_UNAVAILABLE:
            NSLog(@"当前设备网络不可用");
            break;
        case ConnectionStatus_AIRPLANE_MODE:
            NSLog(@"当前设备切换到飞行模式:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_Cellular_2G:
            NSLog(@"当前设备切换到 2G（GPRS、EDGE）低速网络:建立连接的临时状态，SDK会做好自动重连，开发者无须处理");
            break;
        case ConnectionStatus_Cellular_3G_4G:
            NSLog(@"当前设备切换到 3G 或 4G 高速网络:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_WIFI:
            NSLog(@"当前设备切换到 WIFI 网络:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT:
            NSLog(@"当前用户在其他设备上登录，此设备被踢下线");
            break;
        case ConnectionStatus_LOGIN_ON_WEB:
            NSLog(@"当前用户在 Web 端登录:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_SERVER_INVALID:
            NSLog(@"服务器异常:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_VALIDATE_INVALID:
            NSLog(@"连接验证异常:建立连接的临时状态，SDK会做好自动重连，开发者无须处理。");
            break;
        case ConnectionStatus_Connecting:
            NSLog(@"连接中");
            break;
        case ConnectionStatus_Unconnected:
            NSLog(@"连接失败或未连接");
            break;
        case ConnectionStatus_SignUp:
            NSLog(@"已注销");
            break;
        case ConnectionStatus_TOKEN_INCORRECT:
            NSLog(@"Token无效:Token无效一般有两种原因。一是token错误，请您检查客户端初始化使用的AppKey和您服务器获取token使用的AppKey是否一致；二是token过期，是因为您在开发者后台设置了token过期时间，您需要请求您的服务器重新获取token并再次用新的token建立连接。");
            break;
        case ConnectionStatus_DISCONN_EXCEPTION:
            NSLog(@"与服务器的连接已断开,用户被封禁");
            break;
        default:
            break;
    }
}


- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    NSDictionary *dic = message.mj_keyValues;
    NSLog(@"消息接收成功：%@ ------ 剩余：%d", dic, left);
}


- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *userInfo))completion {
    if ([userId isEqualToString:@"user2"]) {
        RCUserInfo *user = [[RCUserInfo alloc] initWithUserId:@"user2" name:@"xs" portrait:@""];
        completion(user);
    }
    if ([userId isEqualToString:@"user3"]) {
        RCUserInfo *user = [[RCUserInfo alloc] initWithUserId:@"user3" name:@"yf" portrait:@""];
        completion(user);
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
