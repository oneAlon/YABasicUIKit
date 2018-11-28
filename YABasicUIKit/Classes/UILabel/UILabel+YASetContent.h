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
 
 @param label 需要改变的行间距的Label
 @param lineSpace 行间距
 */
- (void)ya_changeLineSpaceWith:(float)lineSpace;
/**
 自定义label字间距
 
 @param label 需要改变的字间距的Label
 @param wordSpace 字间距
 */
- (void)ya_changeWordSpaceWith:(float)wordSpace;
/**
 自定义label字间距
 
 @param label 需要改变的字间距的Label
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
- (void)ya_changeSpacelineSpaceWith:(float)lineSpace wordSpaceWith:(float)wordSpace;



@end

NS_ASSUME_NONNULL_END
