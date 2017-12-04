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
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view ya_whenSingleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"单击");
    }];
    
    [self.view ya_whenDoubleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"双击");
    }];

    [self.view ya_whenLongPressed:^(UIGestureRecognizer *gestureRecognizer) {
        NSLog(@"长按");
    }];
}


@end
