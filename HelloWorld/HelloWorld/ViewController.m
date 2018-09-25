//
//  ViewController.m
//  HelloWorld
//
//  Created by 许小六 on 2018/9/3.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "MyConversationListViewController.h"

// user1 zj
#define RCIMTOKEN1 @"guN21JHmZgQSAAnZBCHkld/PgWWkqxW0EgPffotiURuj+cGhEanyYulMDUUWkxYYXgmUPJRp+LnNmiyrHAvk5w=="
// user2 xs
#define RCIMTOKEN2 @"lud9l+CQbdfQY6i5d+G269/PgWWkqxW0EgPffotiURuj+cGhEanyYrRO/Iu76noFJcyE90pdwXOMwXdbphALGA=="

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    bt1.frame = CGRectMake(50, 64 + 50, 200, 50);
//    [bt1 setTitle:@"初始化融云" forState:UIControlStateNormal];
//    [bt1 addTarget:self action:@selector(initRCIM) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:bt1];
    
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt2.frame = CGRectMake(50, 64 + 100, 200, 50);
    [bt2 setTitle:@"连接融云" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(connectRCIM) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
    
    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt3.frame = CGRectMake(50, 64 + 150, 200, 50);
    [bt3 setTitle:@"初始化会话列表" forState:UIControlStateNormal];
    [bt3 addTarget:self action:@selector(initConversationList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt3];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initRCIM {
    [[RCIM sharedRCIM] initWithAppKey:@"82hegw5u8y3rx"];
}

- (void)connectRCIM {
    [[RCIM sharedRCIM] connectWithToken:RCIMTOKEN1 success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        RCUserInfo *user = [[RCUserInfo alloc] initWithUserId:userId name:@"zj" portrait:@""];
        [RCIM sharedRCIM].currentUserInfo = user;
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
        
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}

- (void)initConversationList {
    MyConversationListViewController *vc = [[MyConversationListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
