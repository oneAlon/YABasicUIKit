//
//  YAMacro.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#ifndef YAMacro_h
#define YAMacro_h


/* ===============  Window  =============== */
#define kYAKeyWindow [UIApplication sharedApplication].keyWindow


/* ===============  Screen  =============== */

// System Size
#define kYAScreenBounds                    ([UIScreen mainScreen].bounds)
#define kYAScreenWidth                     ([UIScreen mainScreen].bounds.size.width)
#define kYAScreenHeight                    ([UIScreen mainScreen].bounds.size.height)
#define kYAScreenScale                     ([UIScreen mainScreen].scale)
#define kYASingleLineHeight                (1.f / [UIScreen mainScreen].scale)
#define kYAStatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
#define kYANavigationBarHeight             (44.f)
#define kYATabBarHeight                    (kYAScreenIsIPhoneX ? 83.f : 49.f)
#define kYANavigationAndStatusBarHeight    (kYAStatusBarHeight + kYANavigationBarHeight)
#define kYATableViewBottomButtonHeight     (56.f)
#define kYAScreenRealWidth                 kYAScreenWidth * kYAScreenScale
#define kYAScreenRealHeight                kYAScreenHeight * kYAScreenScale
#define kYAScreenAutoLayoutScale           (kYAScreenWidth / 375)
#define kYAScreenAutoLayoutScaleCeil(x)    ceilf(kYAScreenAutoLayoutScale*(x))

#define kYAScreenIsIPhoneX                (kYAScreenHeight >= 812.0 ? YES : NO )
#define kYAScreenSafeBottomHeight          (kYAScreenIsIPhoneX ? 34.f : 0.0)


//#define kYASafeAreaTopHeight (kYAScreenHeight >= 812.0 ? 88 : 64)
//#define kYASafeAreaBottomHeight (kYAScreenHeight >= 812.0 ? 78 : 44)
//#define kYASafeAreaHeight (kYAScreenHeight - SafeAreaTopHeight - SafeAreaBottomHeight)
//
//#define kYASafeBottomHeight (YAScreenHeight >= 812.0 ? 34 : 0)




// 操作系统版本号
#define kYACurrentSystemVersion            [[UIDevice currentDevice] systemVersion]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// DEBUG日志
#ifdef DEBUG
#define YALog(s,...) NSLog(@"<%p %@:(%d)>\n  %s\n  %@\n\n", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __func__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define YALog(s,...)
#endif


/* ===============  设置图片  =============== */
#define kYAImage(name)                     [UIImage imageNamed:name]

/* ===============  引用  =============== */
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

#endif /* YAMacro_h */
