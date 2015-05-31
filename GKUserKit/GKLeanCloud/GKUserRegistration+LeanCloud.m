//
//  GKUserRegistration+LeanCloud.m
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserRegistration+LeanCloud.h"

@implementation GKUserRegistration (LeanCloud)

- (AVUser *)leancloudUser
{
    AVUser *user = [AVUser user];
    user.username = self.username;
    user.password = self.password;
    user.email = self.email;
    
    return user;
}
@end
