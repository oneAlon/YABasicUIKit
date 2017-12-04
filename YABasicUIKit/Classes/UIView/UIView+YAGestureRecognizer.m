//
//  UIView+YAGestureRecognizer.m
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import "UIView+YAGestureRecognizer.h"

@implementation UIView (YAGestureRecognizer)

- (void)xnb_removeAllGestures
{
    
}

- (void)xnb_whenSingleTapped:(YAGestureRecognizerActionBlock)block
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(text)];
    [self addGestureRecognizer:gesture];
}

- (void)xnb_whenDoubleTapped:(YAGestureRecognizerActionBlock)block
{
    
}

- (void)xnb_whenLongPressed:(YAGestureRecognizerActionBlock)block
{
    
}

- (void)test
{
    NSLog(@"点击了手势");
    
}
@end
