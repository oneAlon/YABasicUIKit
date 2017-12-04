//
//  YAGestureRecognizerVC.m
//  YABasicUIKit_Example
//
//  Created by 郦道元  on 2017/12/4.
//  Copyright © 2017年 OneAlon. All rights reserved.
//

#import "YAGestureRecognizerVC.h"
#import <YABasicUIKit/YABasicUIKit.h>

@interface YAGestureRecognizerVC ()

@end

@implementation YAGestureRecognizerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
