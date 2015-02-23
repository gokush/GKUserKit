//
//  GKUserContainerMock.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserContainerMock.h"
#import "GKUserBackendMock.h"
@implementation GKUserContainerMock

- (id<GKUserBackend>) userBackend {
    return [[GKUserBackendMock alloc] init];
}

@end
