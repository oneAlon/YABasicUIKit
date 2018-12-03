//
//  UIImage+YaIconFont.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YAIconFontInfo;
@interface UIImage (YaIconFont)

+ (UIImage *)iconWithInfo:(YAIconFontInfo *)info;

@end

NS_ASSUME_NONNULL_END
