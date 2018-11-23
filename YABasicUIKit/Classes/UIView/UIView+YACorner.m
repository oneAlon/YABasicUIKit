//
//  UIView+YACorner.m
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import "UIView+YACorner.h"

@implementation UIView (YACorner)

- (void)ya_setCornerRadii:(CGSize)cornerRadii forRoundingCorners:(UIRectCorner)corners
{
    [self ya_setCornerRadii:cornerRadii forRoundingCorners1:corners, nil];
}


- (void)ya_setCornerRadii:(CGSize)cornerRadii forRoundingCorners1:(UIRectCorner)corners, ... NS_REQUIRES_NIL_TERMINATION
{
    UIRectCorner rectCorner = corners;
    va_list args;
    va_start(args, corners);
    if(corners){
        UIRectCorner tempRectCorner;
        while((tempRectCorner = va_arg(args, UIRectCorner))){
            rectCorner = rectCorner | tempRectCorner;
        }
    }
    va_end(args);
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)ya_addBorderWithBorderColor:(UIColor *)borderColor andBorderWidth:(CGFloat)width {
    
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}


- (void)ya_addCornerRadius:(CGFloat)cornerRadius
         andAddBorderWithBorderColor:(UIColor *)borderColor
                      andBorderWidth:(CGFloat)width {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}


@end
