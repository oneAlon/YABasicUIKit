//
//  UILabel+YASetContent.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YASetContent)

/**
 返回对应alignment的label 默认label使用autoLayout
 
 */
+ (instancetype)ya_labelWithTextAlignment:(NSTextAlignment)alignment;

/**
 快速实例化一个UILabel
 
 @param font    字体大小
 @param bColor  背景色
 @param tColor  字体颜色
 @param alignment 文本排列
 @param isWarp  是否换行
 @return        UIlabel
 */
+ (instancetype)ya_labelWithFont:(UIFont *)font
                 backGroundColor:(UIColor *)bColor
                       textColor:(UIColor *)tColor
                   textAlignment:(NSTextAlignment)alignment
                          isWarp:(BOOL)isWarp;


/**
 设置label内容不同颜色
 
 @param allString label的内容
 @param colorString 需要改变颜色的字符串
 @param color 颜色
 @param fontArr 需要改变字体的数组
 */
- (void)ya_setLabelTextColorWithAllString:(NSString *)allString
                           colorString:(NSString *)colorString
                                 color:(UIColor *)color
                               fontArr:(NSArray *)fontArr;

/**
 自定义label行间距
 
 @param label     需要设置的Label
 @param lineSpace 行间距
 */
+ (void)ya_changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace;

/**
 自定义label字间距
 
 @param label     需要设置的Label
 @param wordSpace 字间距
 */
+ (void)ya_changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)wordSpace;
/**
 自定义label字间距
 
 @param label     需要设置的Label
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
+ (void)ya_changeSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace wordSpace:(float)wordSpace;






@end

NS_ASSUME_NONNULL_END
