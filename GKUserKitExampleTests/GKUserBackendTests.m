//
//  GKUserBackendTests.m
//  GKUserKitExample
//
//  Created by MASGG on 15-2-26.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserBackend.h"
#import "GKUserForgotPassword.h"
#import <OCMock/OCMock.h>

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

- (void)testForgotPassword {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    id<GKUserBackend> backend = OCMProtocolMock(@protocol(GKUserBackend));
    
    GKUserForgotPassword *forgotPassword=[[GKUserForgotPassword alloc] init];
    
    forgotPassword.userName = @"goku";
    forgotPassword.verificationCode = @"123456";
    forgotPassword.password = @"goku";
    
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
