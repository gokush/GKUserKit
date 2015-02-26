//
//  GKUserRepository.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUser.h"

typedef NS_ENUM(NSInteger, GKUserQueue) {
    GKUserQueueNone,
    GKUserQueueCreate,
    GKUserQueueUpdate,
    GKUserQueueDelete
};

@protocol GKUserRepository <NSObject>

- (RACSignal *)create:(GKUser *)user;
- (RACSignal *)findUserWithID:(NSInteger)userID;
@end
