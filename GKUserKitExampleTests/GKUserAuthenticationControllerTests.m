//
//  GKUserAuthenticationControllerTests.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/1/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserAuthenticationController.h"
#import <OCMock/OCMock.h>

@interface GKUserAuthenticationControllerTests : XCTestCase

@property (strong, nonatomic) GKUserAuthenticationController *controller;
@end

@implementation GKUserAuthenticationControllerTests

- (void)setUp
{
    [super setUp];
    
    self.controller = [[GKUserAuthenticationController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAuthencate
{
    [self.controller authenticate:nil];
}

- (void)testAuthencateFail
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    self.controller.alertView = OCMClassMock([UIAlertView class]);
    self.controller.authenticateDidFail = ^(NSError *error) {
        XCTAssert(YES, @"");
        dispatch_semaphore_signal(semaphore);
    };
    [self.controller authenticate:nil];
    OCMVerify([self.controller.alertView show]);
    
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

@end
