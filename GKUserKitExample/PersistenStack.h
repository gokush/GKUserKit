//
//  PersistenStack.h
//  NewTest
//
//  Created by 童小波 on 15/3/6.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistenStack : NSObject

- (id)initWithStoreURL:(NSURL *)storeURL modelURL:(NSURL *)modelURL;

@property (nonatomic,strong,readonly) NSManagedObjectContext *managedObjectContext;

@end
