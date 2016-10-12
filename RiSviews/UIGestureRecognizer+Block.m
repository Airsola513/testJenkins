//
//  UIGestureRecognizer+Block.m
//  RiSviews
//
//  Created by Sola on 10/12/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>


@implementation UIGestureRecognizer (Block)

+ (instancetype)sl_gestureRecognizerWithActionBlock:(SolaGestureRecognizerBlock)block
{
    return [[self alloc] initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(id)block
{
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

- (void)addActionBlock:(id)block
{
    if (block) {
        objc_setAssociatedObject(self, @selector(invoke:), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender
{
    SolaGestureRecognizerBlock block = objc_getAssociatedObject(self, _cmd);
    if (block) {
        block(sender);
    }
}

@end
