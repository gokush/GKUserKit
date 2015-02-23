//
//  GKUserContainer.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserService.h"
#import "GKUserBackend.h"
@protocol GKUserContainer <NSObject>
@property (strong, nonatomic) id<GKUserBackend> userBackend;
@property (strong, nonatomic) id<GKUserService> userService;
@end
