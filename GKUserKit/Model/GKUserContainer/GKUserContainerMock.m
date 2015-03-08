//
//  GKUserContainerMock.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserContainerMock.h"
#import "GKUserBackendMock.h"
#import "GKUserServiceImpl.h"

@implementation GKUserContainerMock

- (id<GKUserBackend>)userBackend
{
    return [[GKUserBackendMock alloc] init];
}

- (id<GKUserRepository>)userRepository
{
    return nil;
}

- (id<GKUserService>)userService
{
    GKUserServiceImpl *service = [[GKUserServiceImpl alloc] init];
    service.backend = [self userBackend];
    service.repository = [self userRepository];
    return service;
}

@end
