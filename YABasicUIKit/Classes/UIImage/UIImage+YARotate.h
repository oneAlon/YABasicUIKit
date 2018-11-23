//
//  UIImage+YARotate.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YARotate)
/**
 纠正图片的方向
 
 @param aImage 图片
 */
- (UIImage *)ya_fixOrientation:(UIImage *)aImage;

/**
 按给定的方向旋转图片
 
 @param orient 翻转方向
 */
- (UIImage *)ya_rotate:(UIImageOrientation)orient;


@end

NS_ASSUME_NONNULL_END
