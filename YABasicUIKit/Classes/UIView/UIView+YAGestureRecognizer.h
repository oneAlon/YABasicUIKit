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
- (void)ya_removeAllGestures;

/**
 单击手势
 */
- (void)ya_whenSingleTapped:(YAGestureRecognizerActionBlock)block;

/**
 双击手势
 */
- (void)ya_whenDoubleTapped:(YAGestureRecognizerActionBlock)block;

/**
 长按手势
 */
- (void)ya_whenLongPressed:(YAGestureRecognizerActionBlock)block;
@end
