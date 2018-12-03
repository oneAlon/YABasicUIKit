//
//  YAIconFontInfo.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import "YAIconFontInfo.h"


@implementation YAIconFontInfo

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color
{
    if (self = [super init]) {
        self.text = text;
        self.size = size;
        self.color = color;
    }
    
    return self;
}

+ (instancetype)ya_iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color
{
    return [[YAIconFontInfo alloc] initWithText:text size:size color:color];
}


@end
