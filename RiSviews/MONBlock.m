//
//  MONBlock.m
//  RiSviews
//
//  Created by Sola on 10/11/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import "MONBlock.h"

@implementation MONBlock
+ (void)imp_performBlock:(void(^)())pBlock
{
    pBlock();
}

+ (void)performBlock:(void(^)())pBlock afterDelay:(NSTimeInterval)pDelay
{
    [self performSelector:@selector(imp_performBlock:)
               withObject:[pBlock copy]
               afterDelay:pDelay];
}
@end
