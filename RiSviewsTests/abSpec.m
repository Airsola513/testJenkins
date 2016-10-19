//
//  abSpec.m
//  RiSviews
//
//  Created by Sola on 10/14/16.
//  Copyright 2016 chinaj. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "VVStack.h"


SPEC_BEGIN(abSpec);

describe(@"VVStack", ^{
    context(@"when created", ^{

        __block VVStack *stack = nil;

        beforeEach(^{
            stack = [VVStack new];
        });

        afterEach(^{
            stack = nil;
        });

        it(@"should have the class VVStack", ^{
            [[[VVStack class] shouldNot] beNil];
        });

        it(@"should exist", ^{
            [[stack shouldNot] beNil];
        });

        it(@"should be able to push and get top", ^{
            [stack push:2.3];
            [[theValue([stack top]) should] equal:theValue(2.3)];

            [stack push:4.6];
            [[theValue([stack top]) should] equal:4.6 withDelta:0.001];
        });


        it(@"adfa", ^{
               //            [[theValue( [stack count]) should] beZero];
           });


        //这里无关乎 是否有count 方法
        it(@"should equal contains 0 element", ^{
            [[stack should] haveCountOf:0];
        });

        //这里没有 count 的话就会报错
        it(@"should equal contains 0 element", ^{
            [[stack should] beEmpty];
        });


    });
});


context(@"when new created and pushed 4.6", ^{
    __block VVStack *stack = nil;
    beforeEach(^{
        stack = [VVStack new];
        [stack push:4.6];
    });

    afterEach(^{
        stack = nil;
    });

    it(@"can be poped and the value equals 4.6", ^{
        [[theValue([stack pop]) should] equal:theValue(4.6)];
    });

    it(@"should contains 0 element after pop", ^{
        [stack pop];
        [[stack should] beEmpty];
    });

    it(@"should raise a exception when pop", ^{
        [[theBlock(^{
            [stack pop];
            [stack pop];

        }) should] raiseWithName:@"VVStackPopEmptyException"];
    });


});


SPEC_END
