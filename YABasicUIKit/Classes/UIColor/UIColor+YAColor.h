//
//  UIColor+YAColor.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YAColor)

/**
 根据key来获取颜色 (alpha 默认为 1)
 
 @param  key  十六进制字符串转颜色
 */
+ (UIColor *)ya_colorForKey:(NSString *)key;

/**
 根据key 与 alpha 来获取颜色
 
 @param  key   十六进制字符串转颜色
 @param  alpha 透明度
 */
+ (UIColor *)ya_colorForKey:(NSString *)key alpha:(CGFloat)alpha;

/**
 随机颜色
 
 */

+ (UIColor *)ya_randomColor;


/**
  UIColor 转 UIImage
 
 */
+ (UIImage *)ya_imageWithColor:(UIColor *)color;



@end

NS_ASSUME_NONNULL_END
