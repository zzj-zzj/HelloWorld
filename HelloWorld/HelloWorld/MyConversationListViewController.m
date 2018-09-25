//
//  MyConversationListViewController.m
//  HelloWorld
//
//  Created by 许小六 on 2018/9/4.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "MyConversationListViewController.h"
#import "MyConversationViewController.h"

@interface MyConversationListViewController ()

@end

@implementation MyConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    // 设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    
    // Do any additional setup after loading the view.
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
//    // 新建一个聊天会话View Controller对象,建议这样初始化
//    RCConversationViewController *chat = [[RCConversationViewController alloc] initWithConversationType:model.conversationType
//targetId:model.targetId];
//    // 设置聊天会话界面要显示的标题
//    chat.title = @"想显示的会话标题";
//    // 显示聊天会话界面
//    [self.navigationController pushViewController:chat animated:YES];

    MyConversationViewController *chat = [[MyConversationViewController alloc] init];
    chat.conversationType = model.conversationType;
    chat.targetId = model.targetId;
    [self.navigationController pushViewController:chat animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
