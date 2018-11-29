//
//  UIButton+YASetContent.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/29.
//

#import "UIButton+YASetContent.h"
#import "UIColor+YAColor.h"
@implementation UIButton (YASetContent)


+ (instancetype)ya_buttonWithType:(UIButtonType)type
                   normalTitle:(NSString *)title
                 textAlignment:(NSTextAlignment)alignment
                          font:(CGFloat)fontSize
                    titleColor:(UIColor *)titleColor
               backGroundColor:(UIColor *)backGroundColor
{
    UIButton *button = [self buttonWithType:type];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.textAlignment = alignment;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.backgroundColor = backGroundColor;
    [button sizeToFit];
    
    return button;
}

- (void)ya_setBackgroundImageByColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[UIColor ya_imageWithColor:color] forState:state];
}


@end
