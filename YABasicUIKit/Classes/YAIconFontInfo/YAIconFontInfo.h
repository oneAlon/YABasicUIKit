//
//  YAIconFontInfo.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#define YAIconFontInfoMake(text, imageSize, imageColor) [YAIconFontInfo ya_iconInfoWithText:text size:imageSize color:imageColor]

@interface YAIconFontInfo : NSObject
@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;

+ (instancetype)ya_iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
