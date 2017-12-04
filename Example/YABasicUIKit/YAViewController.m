//
//  YAViewController.m
//  YABasicUIKit
//
//  Created by OneAlon on 12/04/2017.
//  Copyright (c) 2017 OneAlon. All rights reserved.
//

#import "YAViewController.h"

#import <YABasicUIKit/YABasicUIKit.h>

@interface YAViewController ()

@end

@implementation YAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view ya_whenSingleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"单击");
    }];
    
    [self.view ya_whenDoubleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"双击");
    }];

    [self.view ya_whenLongPressed:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"长按");
    }];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
//    [redView ya_setCornerRadii:CGSizeMake(10, 10) forRoundingCorners1:UIRectCornerTopLeft, UIRectCornerTopRight, UIRectCornerBottomLeft, nil];
    [redView ya_setCornerRadii:CGSizeMake(50, 50) forRoundingCorners1:UIRectCornerBottomLeft, nil];
    
}


@end
