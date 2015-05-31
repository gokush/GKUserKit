//
//  GKLeanCloudUserBackend.m
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKLeanCloudUserBackend.h"
#import "GKUserRegistration+LeanCloud.h"

@implementation GKLeanCloudUserBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[GKLeanCloudUserAssembler alloc] init];
    }
    return self;
}

- (RACSignal *)signup:(GKUserRegistration *)registration
{
    __block GKUser *user;
    
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AVUser *leancloudUser = [registration leancloudUser];
        [leancloudUser
         signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
             user = [self.assembler userWithLeanCloudUser:leancloudUser];
             if (succeeded) {
                 [subscriber sendNext:user];
                 [subscriber sendCompleted];
             } else {
                 [subscriber sendError:error];
             }
        }];
        
        return nil;
    }];
}

- (RACSignal *)authencate:(GKUserAuthentication *)authentication
{
    
}
@end
