//
//  StudyTests.m
//  StudyTests
//
//  Created by LvZheng on 16/7/20.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Meal.h"

@interface StudyTests : XCTestCase

@end

@implementation StudyTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void) testMealIntialization{
    
    Meal *potentialItem = [[Meal alloc] initWithName:@"Newest meal" rating:5 photo:nil];
    XCTAssertNotNil(potentialItem);
    
    Meal *invalideRating = [[Meal alloc] initWithName:@"Really bad rating" rating:-1 photo:nil];
    XCTAssertNil(invalideRating,"The num of rating is not valide");
    
    Meal *invalideName = [[Meal alloc] initWithName:nil rating:5 photo:nil];
    XCTAssertNil(invalideName,"Empty name or nil");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
