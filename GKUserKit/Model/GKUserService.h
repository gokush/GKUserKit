//
//  GKUserService.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserBackend.h"
#import "GKUserRegistration.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol GKUserService <NSObject>

- (RACSignal *)signup:(GKUserRegistration *)registration;
@end
