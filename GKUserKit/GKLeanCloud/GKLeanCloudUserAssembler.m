//
//  GKLeanCloudUserAssembler.m
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKLeanCloudUserAssembler.h"

@implementation GKLeanCloudUserAssembler

- (GKUser *)userWithLeanCloudUser:(AVUser *)leancloudUser
{
    GKUser *user = [[GKUser alloc] init];
    user.accessToken = [[GKUserAccessToken alloc] init];
    user.accessToken.accessToken = leancloudUser.sessionToken;
    user.username = leancloudUser.username;
    user.email = leancloudUser.email;
    user.mobilePhoneNumber = leancloudUser.mobilePhoneNumber;
    
    return user;
}
@end
