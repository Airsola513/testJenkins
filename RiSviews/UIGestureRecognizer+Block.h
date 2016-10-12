//
//  UIGestureRecognizer+Block.h
//  RiSviews
//
//  Created by Sola on 10/12/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SolaGestureRecognizerBlock)(id gestureRecognizer);


@interface UIGestureRecognizer (Block)

+ (instancetype)sl_gestureRecognizerWithActionBlock:(SolaGestureRecognizerBlock)block;

@end
