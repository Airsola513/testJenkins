//
//  MONBlock.h
//  RiSviews
//
//  Created by Sola on 10/11/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MONBlock : NSObject

+ (void)performBlock:(void (^)())pBlock afterDelay:(NSTimeInterval)pDelay;


@end
