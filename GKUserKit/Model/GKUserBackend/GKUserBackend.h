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

@protocol GKUserBackend <NSObject>

- (RACSignal *)submitUserFormData:(NSString *)email passWord:(NSString *)passWord;

///
/// 请求远程服务器注册新用户
///
/// @return RACSignal发送一个RACTuple，tuple有两个元素，第零个是`GKUser`，
/// 第一个是`GKUserQueue`
///
/// 示例：
///
///    id<GKUserContainer> container = [[GKUserContainerImpl alloc] init];
///    id<GKUserBackend> backend = [container userBackend];
///    RACSignal *backendSignal = [backend create:registration];
///    [backendSignal subscribeNext:^(RACTuple *parameters) {
///        RACUnpack(GKUser *user, GKUserQueue queue) = parameters;
///        如果是Swift，不能使用RACUnpack，parameters.second的类型是NSInteger
///    }]

- (RACSignal *)create:(GKUserRegistration *)user;

@end
