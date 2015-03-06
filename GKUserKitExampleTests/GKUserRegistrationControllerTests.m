//
//  GKUserRegistrationControllerTests.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/6/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "GKRegistrationController.h"

@interface GKUserRegistrationControllerTests : XCTestCase

@end

@implementation GKUserRegistrationControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSignupFail
{
    UIAlertView *alertView;
    alertView = OCMClassMock([UIAlertView class]);
    OCMStub([alertView show]);
    
    GKRegistrationController *registration;
    registration = [[GKRegistrationController alloc] init];
    registration.alertView = alertView;
    
    [alertView show];
    OCMVerify([alertView show]);
}

@end
