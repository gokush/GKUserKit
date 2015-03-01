//
//  GKUserServeiceImplTest.m
//  GKUserKitExample
//
//  Created by 童小波 on 15/2/24.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKUserServiceImpl.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GKUserServeiceImplTest : XCTestCase

@property (strong, nonatomic) id<GKUserService> userService;

@end

@implementation GKUserServeiceImplTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)signupTest{
    GKUserRegistration *registeration = [[GKUserRegistration alloc] init];
    registeration.username = @"tong";
    registeration.password = @"1111";
    registeration.passwordAgain = @"1111";
    registeration.mobile = @"111111";
    registeration.email = @"tong@qq.com";
        
//    [[self.userService signup:registeration] subscribeNext:^(GKUser *user) {
//        
//        XCTAssert(YES, "signup success!");
//        
//    } error:^(NSError *error) {
//        
//        XCTAssert(YES, "signup fail!");
//        
//    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
