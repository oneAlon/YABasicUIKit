//
//  UILabel+YASetContent.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import "UILabel+YASetContent.h"
#import <PureLayout/PureLayout.h>
@implementation UILabel (YASetContent)

+ (instancetype)ya_labelWithTextAlignment:(NSTextAlignment)alignment
{
    UILabel *label = [[self alloc] initForAutoLayout];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = alignment;
    
    return label;
}
+ (instancetype)ya_labelWithFont:(UIFont *)font
                 backGroundColor:(UIColor *)bColor
                       textColor:(UIColor *)tColor
                   textAlignment:(NSTextAlignment)alignment
                          isWarp:(BOOL)isWarp
{
    UILabel *label = [self ya_labelWithTextAlignment:alignment];
    label.font = font;
    label.backgroundColor = bColor;
    label.textColor = tColor;
    label.numberOfLines = isWarp ? 0 : 1;
    [label sizeToFit];
    return label;
}






- (void)ya_setLabelTextColorWithAllString:(NSString *)allString
                           colorString:(NSString *)colorString
                                 color:(UIColor *)color
                               fontArr:(NSArray *)fontArr
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:allString];
    NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:colorString].location, [[noteStr string] rangeOfString:colorString].length);
    //需要设置的位置
    [noteStr addAttribute:NSForegroundColorAttributeName value:color range:redRange];
    
    if (fontArr) {
        for (int i = 0; i < fontArr.count; i++) {
            NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:fontArr[i]];
            
            NSRange fontRange = NSMakeRange([[noteStr string] rangeOfString:[NSString stringWithFormat:@"%@",dic[@"selectString"]]].location, [[noteStr string] rangeOfString:[NSString stringWithFormat:@"%@",dic[@"selectString"]]].length);
            UIFont *font;
            if ([[dic allKeys] containsObject:@"fontname"]) {
                font = [UIFont fontWithName:dic[@"fontname"] size:[dic[@"font"] floatValue]];
            }else{
                font = [UIFont systemFontOfSize:[dic[@"font"] floatValue]];
            }
            //需要设置的位置
            [noteStr addAttribute:NSFontAttributeName value:font range:fontRange];
        }
        
    }
    [self setAttributedText:noteStr];
}



+ (void)ya_changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace{
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)ya_changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)ya_changeSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace wordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}



@end
