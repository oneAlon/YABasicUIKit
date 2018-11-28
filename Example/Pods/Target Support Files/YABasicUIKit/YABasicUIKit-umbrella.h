#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIColor+YAColor.h"
#import "UIFont+YAFontType.h"
#import "UIImage+YACreate.h"
#import "UIImage+YARotate.h"
#import "UIView+YACorner.h"
#import "UIView+YAFrame.h"
#import "UIView+YAGestureRecognizer.h"
#import "YABasicUIKit.h"
#import "YACommonMethods.h"
#import "YAMacro.h"

FOUNDATION_EXPORT double YABasicUIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char YABasicUIKitVersionString[];

