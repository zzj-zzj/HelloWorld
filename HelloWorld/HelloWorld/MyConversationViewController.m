//
//  MyConversationViewController.m
//  HelloWorld
//
//  Created by 许小六 on 2018/9/4.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "MyConversationViewController.h"

@interface MyConversationViewController ()

@end

@implementation MyConversationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 默认输入类型为语音,这里修改为默认显示加号区域
//    self.defaultInputType = RCChatSessionInputBarInputExtention;
//    [self.chatSessionInputBarControl setInputBarType:RCChatSessionInputBarControlDefaultType style:RC_CHAT_INPUT_BAR_STYLE_CONTAINER_SWITCH_EXTENTION];
    
//    [self.chatSessionInputBarControl resetToDefaultStatus];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.conversationType = self.model.conversationType;
//    self.targetId = self.model.targetId;
    RCUserInfo *targetUser = [[RCIM sharedRCIM] getUserInfoCache:self.targetId];
    self.title = targetUser.name;
    
//    [self.chatSessionInputBarControl.pluginBoardView removeItemAtIndex:2];
//    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"video"] title:@"短视频" tag:6666];
    NSLog(@"pluginBoardView de index ==== %@", self.chatSessionInputBarControl.pluginBoardView.allItems);
    
    // Do any additional setup after loading the view.
}

- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
    if (tag == 6666) {
        NSLog(@"666666666666666666666666666666");
    }
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
