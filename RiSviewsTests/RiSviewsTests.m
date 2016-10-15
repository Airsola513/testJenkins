//
//  RiSviewsTests.m
//  RiSviewsTests
//
//  Created by Sola on 10/1/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import <XCTest/XCTest.h>


@interface RiSviewsTests : XCTestCase

@end


@implementation RiSviewsTests

- (void)setUp
{
    [super setUp];

    NSLog(@"%s", __func__);

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"%s", __func__);
}

- (void)testExample
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    //Give
    NSUInteger a = 10;
    NSUInteger b = 15;
    NSUInteger expected = 24;
    //When
    NSUInteger actual = [self add:a b:b];
    //then
    XCTAssertEqual(expected, actual, @"add方法错误！");
}


- (NSUInteger)add:(NSUInteger)a b:(NSUInteger)b
{
    return a + b;
}


- (void)testABC
{
    XCTFail(@"abc");
}

//
////异步操作
//- (void)testAsynExample {
//
//    XCTestExpectation *exp = [self expectationWithDescription:@"这里可以是操作出错的原因描述。。。"];
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [queue addOperationWithBlock:^{
//        //模拟这个异步操作需要2秒后才能获取结果，比如一个异步网络请求
//        sleep(2);
//        //模拟获取的异步操作后，获取结果，判断异步方法的结果是否正确
//        XCTAssertEqual(@"a", @"a");
//        //如果断言没问题，就调用fulfill宣布测试满足
//        [exp fulfill];
//    }];
//
//    //设置延迟多少秒后，如果没有满足测试条件就报错
//    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"Timeout Error: %@", error);
//        }
//    }];
//}
//
//
//- (void)testPerformanceExample
//{
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
////        sleep(2);
//
//    }];
//}


@end
