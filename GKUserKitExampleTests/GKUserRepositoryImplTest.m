//
//  GKUserRepositoryImplTest.m
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserRepositoryImpl.h"
#import "GKUserKitExample-Swift.h"

@interface GKUserRepositoryImplTest : XCTestCase

@property (strong, nonatomic) id<GKUserRepository> repository;
@property (strong, nonatomic) NSURL *storeURL;
@property (strong, nonatomic) NSURL *modelURL;
@end

@implementation GKUserRepositoryImplTest

- (void)setUp {
    [super setUp];
  GKUserRepositoryImpl *repository = [[GKUserRepositoryImpl alloc] init];
  self.repository = repository;
  self.storeURL =
  [[NSFileManager defaultManager] URLForDirectory:NSDocumentationDirectory
                                         inDomain:NSUserDomainMask
                                appropriateForURL:nil
                                           create:YES error:nil];
  self.storeURL =
    [self.storeURL URLByAppendingPathComponent:@"database2.sqlite"];
  self.modelURL = [[NSBundle mainBundle] URLForResource:@"GKUserModel"
                                          withExtension:@"momd"];
  repository.context = [[[PersistenStack alloc] initWithStoreURL:self.storeURL
                                                    modelURL:self.modelURL]
                     managedObjectContext];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreate {
  dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
  GKUserAccessToken *accessToken = [[GKUserAccessToken alloc] init];
  accessToken.accessToken = @"accessToken";
  accessToken.expires = 1000000;
  accessToken.type = GKMAC;
  
  GKUser *user = [[GKUser alloc] init];
  user.userID = 999;
  user.username = @"goku";
  user.email = @"goku@goku-commerce.com";
  user.accessToken  = accessToken;
  [[self.repository create:user] subscribeNext:^(id x) {
    [[self.repository findUserWithID:999] subscribeNext:^(GKUser *found) {
      dispatch_semaphore_signal(semaphore);
    }];
  }];
  
  dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

- (void)testFindUserWithID {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[self.repository findUserWithID:999] subscribeNext:^(GKUser *found) {
        NSLog(@"%@", found.username);
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

@end
