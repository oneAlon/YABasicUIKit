//
//  UILabel+YASetContent.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import "UILabel+YASetContent.h"

@implementation UILabel (YASetContent)
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

- (void)ya_changeLineSpaceWith:(float)lineSpace{
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

- (void)ya_changeWordSpaceWith:(float)wordSpace {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(lineSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

- (void)ya_changeSpacelineSpaceWith:(float)lineSpace wordSpaceWith:(float)wordSpace {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}
@end
