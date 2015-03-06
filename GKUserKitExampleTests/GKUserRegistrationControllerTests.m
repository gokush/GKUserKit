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

@property (strong, nonatomic) GKRegistrationController *registrationController;
@end

@implementation GKUserRegistrationControllerTests

- (void)setUp {
    [super setUp];
    self.registrationController = [[GKRegistrationController alloc] init];
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
    
    self.registrationController.alertView = alertView;
    
    [alertView show];
    OCMVerify([alertView show]);
}

- (void)testSignup
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    GKUserRegistration *registration = [[GKUserRegistration alloc] init];
    registration.username = @"goku";
    registration.password = @"goku";
    registration.passwordAgain = @"goku";
    registration.email = @"goku@goku-commerce.com";
    
    self.registrationController.signupDidSucceed =
        ^(GKRegistrationController *controller, GKUser *user) {
            XCTAssert(NO, @"success");
            dispatch_semaphore_signal(semaphore);
    };
    
    self.registrationController.signupDidFail = ^(NSError *error) {
        XCTAssert(NO, @"fail");
        dispatch_semaphore_signal(semaphore);
    };
    
    [self.registrationController signup:nil];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 1000));
}

@end
