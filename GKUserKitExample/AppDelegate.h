//
//  AppDelegate.h
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,MBProgressHUDDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navigationController;
@property (assign,nonatomic) BOOL isShowHUD; //等待提示的HUD
@property (strong,nonatomic) NSString *HUDText; //提示文字用的HUD
+(AppDelegate*) sharedInstance;
@end

