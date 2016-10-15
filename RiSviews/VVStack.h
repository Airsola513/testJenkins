//
//  VVStack.h
//  RiSviews
//
//  Created by Sola on 10/14/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VVStack : NSObject

- (void)push:(double)num;
- (double)top;
//- (NSUInteger)count;

- (double)pop;

@end
