//
//  AppDelegate.m
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "AppDelegate.h"
#import "GKUserKitExample-Swift.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface AppDelegate ()
@property (strong,nonatomic) MBProgressHUD *HUD;

@end

@implementation AppDelegate

+(AppDelegate*) sharedInstance
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [[PersistenStack alloc] initWithStoreURL:[self storeURL]
                                  modelURL:[self modelURL]];
  self.navigationController=(UINavigationController*)self.window.rootViewController;
  @weakify(self)
  [RACObserve(self, isShowHUD) subscribeNext:^(id x) {
      @strongify(self)
      BOOL isShowHUD = [x boolValue];
      if (isShowHUD) {
          [self showWithLabel];
      }else{
          [self hideHUD];
      }
  }];
  [RACObserve(self, HUDText) subscribeNext:^(id x) {
      @strongify(self)
      
      [self showTip:x];
    }];
  return YES;
}

- (NSURL *)storeURL
{
  NSURL *url;
  url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentationDirectory
                                               inDomain:NSUserDomainMask
                                      appropriateForURL:nil
                                                 create:YES error:nil];
  return [url URLByAppendingPathComponent:@"database.sqlite"];
}

- (NSURL *)modelURL
{
  return [[NSBundle mainBundle] URLForResource:@"GKUserModel"
                                 withExtension:@"momd"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - MBProgressHud Method

- (void) showTip:(NSString*) tip
{
    if (tip.length==0) {
        return;
    }
    MBProgressHUD *tipHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    tipHUD.labelText=tip;
    tipHUD.mode = MBProgressHUDModeCustomView;
    [self.navigationController.view addSubview:tipHUD];
    [tipHUD show:YES];
    [tipHUD hide:YES afterDelay:2];
}

- (void) showWithLabel
{
    [self showWithLabel:@"请稍候..."];
}
- (void)showWithLabel:(NSString *)text
{
    if(!_HUD){
        _HUD = [[MBProgressHUD alloc] initWithView:self.window.rootViewController.view];
    }
    [self.window.rootViewController.view addSubview:_HUD];
    _HUD.labelText = text;
    [_HUD show:YES];
}

- (void)hideHUD
{
    [_HUD removeFromSuperview];
}

@end
