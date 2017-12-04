//
//  UIView+YAFrame.h
//  YABasicUIKit
//
//  Created by OneAlon on 2017/12/4.
//

#import <UIKit/UIKit.h>

@interface UIView (YAFrame)
// x y
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

// width height
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

// center
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

// margin
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@end
