//
//  VVStack.m
//  RiSviews
//
//  Created by Sola on 10/14/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import "VVStack.h"


@interface VVStack ()
@property (nonatomic, strong) NSMutableArray *numbers;
@end


@implementation VVStack

- (id)init
{
    if (self = [super init]) {
        _numbers = [NSMutableArray new];
    }
    return self;
}

- (void)push:(double)num
{
    [self.numbers addObject:@(num)];
}


- (double)top
{
    return [[self.numbers lastObject] doubleValue];
}

- (NSUInteger)count1
{
    return [self.numbers count];
    //    return 1;
}


- (double)pop
{
    double result = [self top];
    [self.numbers removeLastObject];
    return result;
}


@end
