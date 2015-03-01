//
//  GKUserServiceImpl.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserServiceImpl.h"
#import "GKUser.h"
#import "GKUserRepository.h"
#import "GKUserContainerImpl.h"
#import "GKUserContainerMock.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GKUserServiceImpl()
@property (strong, nonatomic) id<GKUserContainer> container;
@end

@implementation GKUserServiceImpl

- (id)init
{
    self = [super init];
    if (self) {
        self.container = [[GKUserContainerMock alloc] init];
        self.backend = [self.container userBackend];
    }
    return self;
}

- (RACSignal *)signup:(GKUserRegistration *)registration
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [[self.backend signup:registration] subscribeNext:^(GKUser *user) {

        [self.repository create:user];
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        
    } error:^(NSError *error) {
        [subscriber sendError:error];
    }];
    
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)authenticate:(GKUserAuthentication *)authentication
{
    return [self.backend authencate:authentication];
}
@end
