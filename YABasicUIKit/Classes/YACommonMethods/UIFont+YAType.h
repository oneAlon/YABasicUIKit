//
//  UIFont+YAType.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (YAType)
/**
 细体
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_thinFontOfSize:(CGFloat)fontSize;

/**
 正常
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_normalFontOfSize:(CGFloat)fontSize;
/**
 粗体
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_boldFontOfSize:(CGFloat)fontSize;
/**
 PingFangSC-Medium
 
 @param fontSize 文字字号
 */

+ (UIFont *)ya_PingFangSCMediumOfSize:(CGFloat)fontSize;
/**
 PingFangSC-Regular
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_PingFangSCRegularOfSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
