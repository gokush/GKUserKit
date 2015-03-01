//
//  UserauthenticationViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/18/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "GKUserAuthenticationTableViewCell.h"
#import "GKUserAuthentication.h"
#import "GKUserService.h"

@interface GKUserAuthenticationController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<GKUserService> service;
@property (strong, nonatomic) GKUserAuthentication *user;
@property (strong, nonatomic) MBProgressHUD *hud;
@property (copy, nonatomic)
void (^authenticateDidSucceed)(GKUserAuthenticationController *controller,
                               GKUser *user);

@property (copy, nonatomic) void (^authenticateDidFail)(NSError *error);

- (IBAction)forgotPasswordDidTap:(id)sender;
- (IBAction)registrationDidTap:(id)sender;
@end
