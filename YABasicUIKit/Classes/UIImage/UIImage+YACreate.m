//
//  UIImage+YACreate.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import "UIImage+YACreate.h"

@implementation UIImage (YACreate)

+ (UIImage *)ya_imageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
