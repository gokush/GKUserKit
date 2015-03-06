//
//  GKUserBackendTests.m
//  GKUserKitExample
//
//  Created by MASGG on 15-2-26.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserContainer.h"
#import "GKUserBackend.h"
#import "GKUserContainerImpl.h"
#import "GKUserForgotPassword.h"
@interface GKUserBackendTests : XCTestCase

@end

@implementation GKUserBackendTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testForgotPassword {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    id<GKUserContainer> container = [[GKUserContainerImpl alloc] init];
    id<GKUserBackend> backend = [container userBackend];
    GKUserForgotPassword *forgotPassword=[[GKUserForgotPassword alloc] init];
    forgotPassword.userName=@"ggg";
    forgotPassword.verificationCode=@"123456";
    forgotPassword.password=@"111";
    
    RACSignal *backendSignal = [backend forgotPassword:forgotPassword];
    [backendSignal subscribeNext:^(GKUserForgotPassword *forgotPassword) {
        XCTAssert(YES, @"Pass");
        dispatch_semaphore_signal(semaphore);
    } error:^(NSError *error) {
        NSLog(@"失败原因， %@", error.localizedDescription);
        XCTFail(@"提交忘记密码的请求失败");
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}
@end
