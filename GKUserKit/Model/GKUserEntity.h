//
//  GKUserEntity.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GKUserEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * accessToken;
@property (nonatomic, retain) NSNumber * accessTokenExpires;
@property (nonatomic, retain) NSNumber * accessTokenType;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * avatar;

@end
