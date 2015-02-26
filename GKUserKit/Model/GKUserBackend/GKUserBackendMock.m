//
//  GKUserBackendMock.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserBackendMock.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUserAccessToken.h"
#import "GKUser.h"
 
@implementation GKUserBackendMock

- (RACSignal *) submitUserFormData:(NSString *)email passWord:(NSString *)passWord {
    @weakify(self)
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        GKUserAccessToken *accessToken = [[GKUserAccessToken alloc] init];
        accessToken.accessToken = @"12334jkajgoaqagajgjagpkjg";
        
        [subscriber sendNext:accessToken];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}
//- (RACSignal *)signup:(GKUserRegistration *)user
//{
//    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        GKUser *user;
//        GKUserQueue queue;
//        [subscriber sendNext:RACTuplePack(user,queue)];
//        
//        return [RACDisposable disposableWithBlock:^{
//        }];
//    }];
//}
@end
