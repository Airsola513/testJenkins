//
//  AnotherTest.m
//  RiSviews
//
//  Created by Sola on 10/14/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VVStack.h"


@interface AnotherTest : XCTestCase

@end


@implementation AnotherTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testStackExist
{
    XCTAssertNotNil([VVStack class], @"VVStack class should exist.");
}

- (void)testStackObjectCanBeCreated
{
    VVStack *stack = [VVStack new];
    XCTAssertNotNil(stack, @"VVStack object can be created.");
}

- (void)testPushANumberAndGetIt
{
    VVStack *stack = [VVStack new];
    [stack push:2.3];
    double topNumber = [stack top];
    XCTAssertEqual(topNumber, 2.3, @"VVStack should can be pushed and has that top value.");

    [stack push:4.6];
    topNumber = [stack top];
    XCTAssertEqual(topNumber, 4.6, @"Top value of VVStack should be the last num pushed into it");
}


@end
