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
    [[self.userBackend signup:registration] subscribeNext:^(RACTuple *parameters) {

        GKUser *user = parameters.first;
        GKUserQueue queue = (GKUserQueue)parameters.second;
        if (queue == GKUserQueueNone) {
            [self.userRepository userPesistent:user];
        }
    } error:^(NSError *error) {
      [subscriber sendError:error];
    }];
    
    return (RACDisposable *)nil;
  }];
}
@end
