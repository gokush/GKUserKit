//
//  GKUserServiceImpTests.m
//  GKUserKitExample
//
//  Created by 童小波 on 15/2/26.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserServiceImpl.h"
#import "GKUserContainerMock.h"

@interface GKUserServiceImpTests : XCTestCase

@property (strong, nonatomic) id<GKUserService> userService;

@end

@implementation GKUserServiceImpTests

- (void)setUp {
    [super setUp];
    
    GKUserContainerMock *mock = [[GKUserContainerMock alloc] init];
    self.userService = mock.userService;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSignup
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    GKUserRegistration *registration = [[GKUserRegistration alloc] init];
    registration.username = @"tong";
    registration.password = @"11111";
    registration.passwordAgain = @"11111";
    registration.email = @"tong@qq.com";
    registration.mobile = @"1111111111";
    [[self.userService signup:registration] subscribeNext:^(id x) {
        
        XCTAssert(YES, @"signup success!");
        dispatch_semaphore_signal(semaphore);
        
    } error:^(NSError *error) {
        
        XCTFail(@"signup fail!");
        dispatch_semaphore_signal(semaphore);
        
    }];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
