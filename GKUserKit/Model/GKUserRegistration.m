//
//  GKUserRegistration.m
//  GKUserKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserRegistration.h"

@implementation GKUserRegistration

- (GKUserRegistration *)initRegistrationWithUsername:(NSString *)username passWord:(NSString *)password email:(NSString *)email {
    return [self createRegistrationWithUsername:username passWord:password passwordAgain:nil mobile:nil email:nil];
}




- (GKUserRegistration *)createRegistrationWithUsername:(NSString *)username passWord:(NSString *)password passwordAgain:(NSString *)passwordAgain mobile:(NSString *)mobile email:(NSString *)email {
    GKUserRegistration *registration = [[GKUserRegistration alloc] init];
    registration.username = username;
    registration.password = password;
    registration.passwordAgain = passwordAgain;
    registration.mobile = mobile;
    registration.email = email;
    
    return registration;
}

@end
