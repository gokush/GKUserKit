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
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation GKUserServiceImpl
@synthesize userBackend;
@synthesize userRepository;

- (RACSignal *)signup:(GKUserRegistration *)registration
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [[self.userBackend signup:registration] subscribeNext:^(GKUser *user) {

        [self.userRepository create:user];
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        
    } error:^(NSError *error) {
        [subscriber sendError:error];
    }];
    
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)authenticate:(UserAuthenticationModel *)user
{
    return nil;
}
@end
