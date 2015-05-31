//
//  GKUserRegistration+LeanCloud.h
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserRegistration.h"
#import <AVOSCloud/AVOSCloud.h>

@interface GKUserRegistration (LeanCloud)

- (AVUser *)leancloudUser;
@end
