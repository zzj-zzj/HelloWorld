//
//  AppDelegate.h
//  HelloWorld
//
//  Created by 许小六 on 2018/9/3.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCIMConnectionStatusDelegate, RCIMReceiveMessageDelegate, RCIMUserInfoDataSource>

@property (strong, nonatomic) UIWindow *window;


@end

