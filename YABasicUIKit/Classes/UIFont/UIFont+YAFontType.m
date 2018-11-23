//
//  UIFont+YAFontType.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import "UIFont+YAFontType.h"

@implementation UIFont (YAFontType)

/**
 细体
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_thinFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
}
/**
 正常
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_normalFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}
/**
 粗体
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_boldFontOfSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fontSize];
}
/**
 PingFangSC-Medium
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_pingFangSCMediumOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}
/**
 PingFangSC-Regular
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_pingFangSCRegularOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}

@end
