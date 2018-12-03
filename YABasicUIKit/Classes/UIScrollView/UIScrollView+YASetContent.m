//
//  UIScrollView+YASetContent.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import "UIScrollView+YASetContent.h"
#import "UIView+YAFrame.h"

@implementation UIScrollView (YASetContent)
- (void)setContentOffsetX:(CGFloat)contentOffsetX
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.x = contentOffsetX;
    self.contentOffset = contentOffset;
}

- (CGFloat)contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setContentOffsetY:(CGFloat)contentOffsetY
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.y = contentOffsetY;
    self.contentOffset = contentOffset;
}

- (CGFloat)contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setContentInsetTop:(CGFloat)contentInsetTop
{
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.top = contentInsetTop;
    self.contentInset = edgeInsets;
}

- (CGFloat)contentInsetTop
{
    return self.contentInset.top;
}

- (void)setContentInsetLeft:(CGFloat)contentInsetLeft
{
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.left = contentInsetLeft;
    self.contentInset = edgeInsets;
}

- (CGFloat)contentInsetLeft
{
    return self.contentInset.left;
}

- (void)setContentInsetBottom:(CGFloat)contentInsetBottom
{
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.bottom = contentInsetBottom;
    self.contentInset = edgeInsets;
}

- (CGFloat)contentInsetBottom
{
    return self.contentInset.bottom;
}

- (void)setContentInsetRight:(CGFloat)contentInsetRight
{
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.right = contentInsetRight;
    self.contentInset = edgeInsets;
}

- (CGFloat)contentInsetRight
{
    return self.contentInset.right;
}

- (void)setScrollIndicatorInsetBottom:(CGFloat)scrollIndicatorInsetBottom
{
    UIEdgeInsets edgeInsets = self.scrollIndicatorInsets;
    edgeInsets.bottom = scrollIndicatorInsetBottom;
    self.scrollIndicatorInsets = edgeInsets;
}

- (CGFloat)scrollIndicatorInsetBottom
{
    return self.scrollIndicatorInsets.bottom;
}

- (void)setScrollIndicatorInsetLeft:(CGFloat)scrollIndicatorInsetLeft
{
    UIEdgeInsets edgeInsets = self.scrollIndicatorInsets;
    edgeInsets.left = scrollIndicatorInsetLeft;
    self.scrollIndicatorInsets = edgeInsets;
}

- (CGFloat)scrollIndicatorInsetLeft
{
    return self.scrollIndicatorInsets.left;
}

- (void)setScrollIndicatorInsetRight:(CGFloat)scrollIndicatorInsetRight
{
    UIEdgeInsets edgeInsets = self.scrollIndicatorInsets;
    edgeInsets.right = scrollIndicatorInsetRight;
    self.scrollIndicatorInsets = edgeInsets;
}

- (CGFloat)scrollIndicatorInsetRight
{
    return self.scrollIndicatorInsets.right;
}

- (void)setScrollIndicatorInsetTop:(CGFloat)scrollIndicatorInsetTop
{
    UIEdgeInsets edgeInsets = self.scrollIndicatorInsets;
    edgeInsets.top = scrollIndicatorInsetTop;
    self.scrollIndicatorInsets = edgeInsets;
}

- (CGFloat)scrollIndicatorInsetTop
{
    return self.scrollIndicatorInsets.top;
}

- (void)setContentSizeWidth:(CGFloat)contentSizeWidth
{
    CGSize contentSize = self.contentSize;
    contentSize.width = contentSizeWidth;
    self.contentSize = contentSize;
}

- (CGFloat)contentSizeWidth
{
    return self.contentSize.width;
}

- (void)setContentSizeHeight:(CGFloat)contentSizeHeight
{
    CGSize contentSize = self.contentSize;
    contentSize.height = contentSizeHeight;
    self.contentSize = contentSize;
}

- (CGFloat)contentSizeHeight
{
    return self.contentSize.height;
}

- (void)ya_stopScrolling
{
    CGPoint offset = self.contentOffset;
    offset.x -= 1.0;
    offset.y -= 1.0;
    [self setContentOffset:offset animated:NO];
    offset.x += 1.0;
    offset.y += 1.0;
    [self setContentOffset:offset animated:NO];
}

- (BOOL)ya_isScrollToBottom
{
    return [self ya_isScrollToBottomWithDeviation:0];
}

- (BOOL)ya_isScrollToBottomWithDeviation:(CGFloat)deviation
{
    CGFloat height = self.contentSize.height - deviation;
    if (height <= 0) {
        return YES;
    }
    CGFloat offsetY = self.contentOffsetY;
    if (offsetY + self.height >= height) {
        return YES;
    }
    return NO;
}

@end
