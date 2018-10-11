//
//  UIFont+YAType.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/10/11.
//

#import "UIFont+YAType.h"

@implementation UIFont (YAType)
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
+ (UIFont *)ya_PingFangSCMediumOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}
/**
 PingFangSC-Regular
 
 @param fontSize 文字字号
 */
+ (UIFont *)ya_PingFangSCRegularOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}



@end
