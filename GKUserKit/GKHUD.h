//
//  GKHUD.h
//  GKUserKitExample
//
//  Created by 小悟空 on 3/6/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKHUD : NSObject

- (void)showMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)second;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
+ (void)setHUD:(GKHUD *)hud;
+ (instancetype)defaultHUD;
@end
