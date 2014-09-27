//
//  UIView+CoreAnimation.h
//  CoreAnimationPlayGround
//
//  Created by Daniel Tavares on 27/03/2013.
//  Copyright (c) 2013 Daniel Tavares. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ExplodeAnimationBlock)(CAAnimation *animation);

@interface UIView (Explode)

- (void)lp_explode;
- (void)lp_explode:(ExplodeAnimationBlock)block;

@end
