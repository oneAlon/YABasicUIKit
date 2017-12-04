//
//  UIView+YAGestureRecognizer.h
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import <UIKit/UIKit.h>

typedef void(^YAGestureRecognizerActionBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (YAGestureRecognizer)

/**
 移除手势
 */
- (void)xnb_removeAllGestures;

/**
 点击手势
 */
- (void)xnb_whenSingleTapped:(YAGestureRecognizerActionBlock)block;

/**
 双击手势
 */
- (void)xnb_whenDoubleTapped:(YAGestureRecognizerActionBlock)block;

/**
 长按手势
 */
- (void)xnb_whenLongPressed:(YAGestureRecognizerActionBlock)block;
@end
