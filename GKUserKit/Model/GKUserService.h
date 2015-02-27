//
//  GKUserService.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserBackend.h"
#import "GKUserRepository.h"
#import "GKUserRegistration.h"
#import "UserAuthenticationModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol GKUserService <NSObject>
@property (strong, nonatomic) id<GKUserBackend> userBackend;
@property (strong, nonatomic) id<GKUserRepository> userRepository;

///
/// 注册新用户
///
/// @return RACSignal发送一个RACTuple，tuple有两个元素，第零个是`GKUser`，
/// 第一个是`GKUserQueue`
///
/// 示例：
///
///    id<GKUserContainer> container = [[GKUserContainerImpl alloc] init];
///    id<GKUserBackend> backend = [container userBackend];
///    RACSignal *backendSignal = [backend signup:registration];
///    [backendSignal subscribeNext:^(RACTuple *parameters) {
///        RACUnpack(GKUser *user, GKUserQueue queue) = parameters;
///        如果是Swift，不能使用RACUnpack，parameters.second的类型是NSInteger
///    }]

- (RACSignal *)signup:(GKUserRegistration *)registration;

- (RACSignal *)authenticate:(UserAuthenticationModel *)user;
@end
