//
//  GKUserBackend.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUserRegistration.h"
#import "GKUserForgotPassword.h"
@protocol GKUserBackend <NSObject>

- (RACSignal *)submitUserFormData:(NSString *)email passWord:(NSString *)passWord;

///
/// 请求远程服务器注册新用户
///
/// @return `GKUser`，
///
/// 示例：
///
///    id<GKUserContainer> container = [[GKUserContainerImpl alloc] init];
///    id<GKUserBackend> backend = [container userBackend];
///    RACSignal *backendSignal = [backend signup:registration];
///    [backendSignal subscribeNext:^(GKUser *user) {
///        NSLog(@"username %@", user.username);
///    }]

- (RACSignal *)signup:(GKUserRegistration *)user;

///
/// 请求远程服务器忘记密码后设置新密码
///
/// @return RACSignal发送一个GKUserForgotPassword对象
///
/// 示例：
///
///    id<GKUserContainer> container = [[GKUserContainerImpl alloc] init];
///    id<GKUserBackend> backend = [container userBackend];
///    RACSignal *backendSignal = [backend forgotPassword:forgotPassword];
///    [backendSignal subscribeNext:^(GKUserForgotPassword *forgotPassword) {
///    }]
- (RACSignal *)forgotPassword:(GKUserForgotPassword*)forgotPassword;
@end
