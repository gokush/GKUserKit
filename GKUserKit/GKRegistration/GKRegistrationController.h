//
//  ViewController.h
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKUserService.h"

@interface GKRegistrationController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) id<GKUserService> service;
@property (strong, nonatomic) GKUserRegistration *registration;

/// 响应注册事件
///
/// 注册事件可能是UIButton的Tap事件，也可能是UITableView的选择事件，
/// 无论如何都需要在接口中写出签名
///
- (IBAction)signup:(id)sender;
@end

