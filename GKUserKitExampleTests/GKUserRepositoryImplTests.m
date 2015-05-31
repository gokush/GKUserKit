//
//  GKUserRepositoryImplTests.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserRepositoryImpl.h"

@interface GKUserRepositoryImplTests : XCTestCase

@property (strong, nonatomic) id<GKUserRepository> repository;
@end

@implementation GKUserRepositoryImplTests

- (void)setUp {
    [super setUp];
    
    self.repository = [[GKUserRepositoryImpl alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreate
{
    GKUser *user;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[self.repository create:user] subscribeNext:^(id x) {
    }];
    
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

- (void)testFindUserWithID
{
    
}

- (void)testUpdateLastAuthencateDate
{
    
}

- (void)testLastAuthencateUser
{
    
}

@end
