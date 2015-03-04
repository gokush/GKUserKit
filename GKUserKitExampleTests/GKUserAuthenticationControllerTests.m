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

@interface GKUserAuthenticationControllerTests : XCTestCase

@property (strong, nonatomic) GKUserAuthenticationController *controller;
@end

@implementation GKUserAuthenticationControllerTests

- (void)setUp {
    [super setUp];
    
    self.controller = [[GKUserAuthenticationController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAuthencate {
    [self.controller authenticate];
    
}

@end
