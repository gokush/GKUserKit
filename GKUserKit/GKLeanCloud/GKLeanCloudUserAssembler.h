//
//  GKLeanCloudUserAssembler.h
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUser.h"
#import <AVOSCloud/AVOSCloud.h>

@interface GKLeanCloudUserAssembler : NSObject

- (GKUser *)userWithLeanCloudUser:(AVUser *)leancloudUser;
@end
