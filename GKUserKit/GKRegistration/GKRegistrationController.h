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

- (IBAction)signup:(id)sender;
@end

