//
//  UIColor+YAColor.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import "UIColor+YAColor.h"

@implementation UIColor (YAColor)
/**
 十六进制字符串转颜色 (alpha 默认为 1)
 
 @param  key  十六进制字符串转颜色
 */
+ (UIColor *)ya_colorForKey:(NSString *)key
{
    return [self ya_colorForKey:key alpha:1.0f];
}

/**
 根据十六进制字符串 与 alpha 来获取颜色
 
 @param  key   十六进制字符串转颜色
 @param  alpha 透明度
 */
+ (UIColor *)ya_colorForKey:(NSString *)key alpha:(CGFloat)alpha
{
    return [UIColor ya_colourWithHexString:key alpha:alpha];
}

/**
 随机颜色
 */
+ (UIColor *)ya_randomColor
{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

#pragma mark - Others
+ (UIColor *)ya_colourWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)ya_colourWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [UIColor ya_colourWithRGBHex:hexNum alpha:alpha];
}


+ (UIImage *)ya_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
