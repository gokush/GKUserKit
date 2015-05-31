//
//  GKLeanCloudUserBackend.h
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserBackend.h"
#import "GKLeanCloudUserAssembler.h"

@interface GKLeanCloudUserBackend : NSObject

@property (strong, nonatomic) GKLeanCloudUserAssembler *assembler;
@end
