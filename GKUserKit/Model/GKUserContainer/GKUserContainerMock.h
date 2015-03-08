//
//  GKUserContainerMock.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserContainer.h"

@interface GKUserContainerMock : NSObject  <GKUserContainer>

@property (strong, nonatomic) id<GKUserBackend> userBackend;
@property (strong, nonatomic) id<GKUserService> userService;
@property (strong, nonatomic) id<GKUserRepository> userRepository;

@end
