//
//  GKUserServiceImpl.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUserBackend.h"
#import "GKUserService.h"

@interface GKUserServiceImpl : NSObject <GKUserService>
@property (strong, nonatomic) id<GKUserBackend> userBackend;

- (RACSignal *)signup:(GKUserRegistration *)registration;
@end
