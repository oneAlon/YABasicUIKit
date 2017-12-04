//
//  UIView+YAGestureRecognizer.m
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import "UIView+YAGestureRecognizer.h"
#import <objc/runtime.h>

static char kWhenTappedBlockKey;
static char kWhenDoubleTappedBlockKey;
static char kWhenLongPressedBlockKey;

@implementation UIView (YAGestureRecognizer)

- (void)ya_removeAllGestures
{
    for (UITapGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
}

- (void)ya_whenSingleTapped:(YAGestureRecognizerActionBlock)block
{
    UITapGestureRecognizer *gesture = [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(_viewWasTapped:)];
    gesture.cancelsTouchesInView = NO;
    gesture.delaysTouchesBegan = NO;
    gesture.delaysTouchesEnded = NO;
    [self _addRequirementToSingleTapsRecognizer:gesture];
    [self _setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)ya_whenDoubleTapped:(YAGestureRecognizerActionBlock)block
{
    UITapGestureRecognizer *gesture = [self addTapGestureRecognizerWithTaps:2 touches:1 selector:@selector(_viewWasDoubleTapped:)];
    gesture.cancelsTouchesInView = NO;
    [self _addRequiredToDoubleTapsRecognizer:gesture];
    [self _setBlock:block forKey:&kWhenDoubleTappedBlockKey];
}

- (void)ya_whenLongPressed:(YAGestureRecognizerActionBlock)block
{
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(_longPressed:)];
    gesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:gesture];
    [self _setBlock:block forKey:&kWhenLongPressedBlockKey];
}

- (void)_longPressed:(UILongPressGestureRecognizer *)longGesture
{
    if (longGesture.state == UIGestureRecognizerStateBegan) {
        [self _runBlockForKey:&kWhenLongPressedBlockKey forGesture:longGesture];
    }else{
    }
}

- (void)_viewWasDoubleTapped:(UITapGestureRecognizer *)tap
{
    [self _runBlockForKey:&kWhenDoubleTappedBlockKey forGesture:tap];
}

- (void)_viewWasTapped:(UITapGestureRecognizer *)tap
{
    [self _runBlockForKey:&kWhenTappedBlockKey forGesture:tap];
}

#pragma mark - Block

- (void)_runBlockForKey:(void *)blockKey forGesture:(UIGestureRecognizer *)tapGesture
{
    YAGestureRecognizerActionBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) {
        block(tapGesture);
    }
}

- (void)_setBlock:(YAGestureRecognizerActionBlock)block forKey:(void *)blockKey
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UITapGestureRecognizer*)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGesture];
    
    return tapGesture;
}

#pragma mark - 手势处理

- (void)_addRequirementToSingleTapsRecognizer:(UIGestureRecognizer*) recognizer
{
    for (UIGestureRecognizer *gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)gesture;
            if (tapGesture.numberOfTouchesRequired == 1 && tapGesture.numberOfTapsRequired == 2) {
                [recognizer requireGestureRecognizerToFail:tapGesture];
            }
        }
    }
}

- (void)_addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer*) recognizer
{
    for (UIGestureRecognizer *gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)gesture;
            if (tapGesture.numberOfTouchesRequired == 1 && tapGesture.numberOfTapsRequired == 1) {
                [tapGesture requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}
@end
