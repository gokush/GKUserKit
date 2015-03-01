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

- (id<GKUserBackend>)userBackend {
    return [[GKUserBackendMock alloc] init];
}

- (id<GKUserService>)userService
{
    id<GKUserService> service = [[GKUserServiceImpl alloc] init];
    service.backend = [self userBackend];
    return service;
}

@end
