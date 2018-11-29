//
//  UIButton+YASetContent.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YASetContent)
/**
 快速创建UIButton
 @param type        buttonType
 @param title       buttonTitle
 @param alignment   titleAlign
 @param fontSize    titleSize
 @param titleColor  字体颜色
 @param backGroundColor 背景颜色
 @return            UIButton
 */
+ (instancetype)ya_buttonWithType:(UIButtonType)type
                   normalTitle:(NSString *)title
                 textAlignment:(NSTextAlignment)alignment
                          font:(CGFloat)fontSize
                    titleColor:(UIColor *)titleColor
               backGroundColor:(UIColor *)backGroundColor;


/**
 设置button的纯色背景图
 */
- (void)ya_setBackgroundImageByColor:(UIColor *)color forState:(UIControlState)state;
@end

NS_ASSUME_NONNULL_END
