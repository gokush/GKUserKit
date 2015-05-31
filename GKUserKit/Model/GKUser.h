//
//  User.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserAccessToken.h"

@class GKResizer;
@interface GKUser : NSObject <NSCoding>

@property (assign, nonatomic) NSInteger userID;
@property (strong, nonatomic) NSString *objectID;
@property (strong, nonatomic) NSString *sessionID;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *mobilePhoneNumber;
@property (strong, nonatomic) GKResizer *avatar;
@property (strong, nonatomic) GKUserAccessToken *accessToken;
@property (strong, nonatomic) NSDate *lastAuthencateDate;

- (BOOL)authorized;
- (void)merge:(GKUser *)user;
@end
