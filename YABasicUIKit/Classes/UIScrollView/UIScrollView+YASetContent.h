//
//  UIScrollView+YASetContent.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (YASetContent)

@property (nonatomic, assign) CGFloat contentOffsetX;
@property (nonatomic, assign) CGFloat contentOffsetY;

@property (nonatomic, assign) CGFloat contentInsetTop;
@property (nonatomic, assign) CGFloat contentInsetLeft;
@property (nonatomic, assign) CGFloat contentInsetBottom;
@property (nonatomic, assign) CGFloat contentInsetRight;

@property (nonatomic, assign) CGFloat scrollIndicatorInsetTop;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetLeft;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetBottom;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetRight;

@property (nonatomic, assign) CGFloat contentSizeWidth;
@property (nonatomic, assign) CGFloat contentSizeHeight;

- (void)ya_stopScrolling;

- (BOOL)ya_isScrollToBottom;

- (BOOL)ya_isScrollToBottomWithDeviation:(CGFloat)deviation;


@end

NS_ASSUME_NONNULL_END
