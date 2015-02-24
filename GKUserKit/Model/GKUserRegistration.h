//
//  GKUserRegistration.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKUserRegistration : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *passwordAgain;
@property (strong, nonatomic) NSString *mobile;
@property (strong, nonatomic) NSString *email;
@end
