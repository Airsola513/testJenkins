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
    // aga
    [self.numbers addObject:@(num)];
}

// commit
- (double)top
{
    return [[self.numbers lastObject] doubleValue];
}

- (NSUInteger)count
{
    return [self.numbers count];
    //    return 1;
}

- (double)pop
{
    if ([self count] == 0) {
        [NSException raise:@"VVStackPopEmptyException" format:@"Can not pop an empty stack."];
    }
    double result = [self top];
    [self.numbers removeLastObject];
    return result;
}


- (void)noneCoberage
{
    //  no cover
    NSLog(@"%s", __func__);
}

@end
