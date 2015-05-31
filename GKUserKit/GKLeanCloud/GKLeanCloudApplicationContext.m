//
//  GKLeanCloudApplicationContext.m
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKLeanCloudApplicationContext.h"
#import "GKLeanCloudUserBackend.h"
#import "GKUserServiceImpl.h"

@implementation GKLeanCloudApplicationContext

- (void)configure
{
    [self bindClass:[GKLeanCloudUserBackend class]
         toProtocol:@protocol(GKUserBackend)];
    [self bindClass:[GKUserServiceImpl class]
         toProtocol:@protocol(GKUserService)];
}
@end
