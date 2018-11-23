//
//  UIImage+YACreate.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YACreate)
/**
 将UIColor生成UIImage
 
 @param color 颜色
 */
+ (UIImage *)ya_imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
