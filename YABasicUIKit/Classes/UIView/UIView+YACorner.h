//
//  UIView+YACorner.h
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import <UIKit/UIKit.h>

@interface UIView (YACorner)

/**
 设置圆角
 
 @param cornerRadii 圆角大小
 @param corners 指定哪个圆角
 */
- (void)ya_setCornerRadii:(CGSize)cornerRadii forRoundingCorners:(UIRectCorner)corners;

/**
 设置圆角

 @param cornerRadii 圆角大小
 @param corners 指定哪几个角圆角
 */
- (void)ya_setCornerRadii:(CGSize)cornerRadii forRoundingCorners1:(UIRectCorner)corners, ... NS_REQUIRES_NIL_TERMINATION;
@end
