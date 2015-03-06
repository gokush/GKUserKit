//
//  ViewController.h
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKUserService.h"
#import <MBProgressHUD/MBProgressHUD.h>

/// 用户注册控制器
@interface GKRegistrationController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
/// Service
@property (strong, nonatomic) id<GKUserService> service;
/// class GKUserRegistration 模型
@property (strong, nonatomic) GKUserRegistration *registration;
/// hud 实例
@property (strong, nonatomic) MBProgressHUD *hud;

/// 注册成功
/// @param controller 用户注册控制器
/// @param user 用户
@property (copy, nonatomic)
void (^signupDidSucceed)(GKRegistrationController *controller,
GKUser *user);

/// 注册失败
/// @param error 失败信息
@property (copy, nonatomic) void (^signupDidFail)(NSError *error);
/// 响应注册事件
///
/// 注册事件可能是UIButton的Tap事件，也可能是UITableView的选择事件，
/// 无论如何都需要在接口中写出签名
///
/// @param sender UIButton
///
- (IBAction)signup:(id)sender;
@end

