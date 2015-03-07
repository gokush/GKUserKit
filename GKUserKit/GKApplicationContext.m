//
//  GKApplicationContext.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/7/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKApplicationContext.h"
#import "GKUserService.h"

#import "GKUserServiceImpl.h"
#import "GKUserAuthenticationController.h"
#import "GKRegistrationController.h"

@implementation GKApplicationContext

@end

@implementation GKApplicationContextDemonstration

- (void)configure
{
    [self bind:[GKUserServiceImpl class] toProtocol:@protocol(GKUserService)];
    [self bind:[GKUserRegistration class] toClass:[GKUserRegistration class]];
}
@end