//
//  GKUserServiceImpl.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserServiceImpl.h"

@implementation GKUserServiceImpl

- (RACSignal *)signup:(GKUserRegistration *)registration
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [[self.userBackend signup:registration] subscribeNext:^(id x) {
      [subscriber sendNext:x];
      [subscriber sendCompleted];
    } error:^(NSError *error) {
      [subscriber sendError:error];
    }];
    
    return (RACDisposable *)nil;
  }];
}
@end
