//
//  YAMacro.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/23.
//

#ifndef YAMacro_h
#define YAMacro_h


/* ===============  Window  =============== */
#define YAKeyWindow [UIApplication sharedApplication].keyWindow


/* ===============  Screen  =============== */
#define YAScreenBounds [UIScreen mainScreen].bounds
#define YAScreenSize YAScreenBounds.size
#define YAScreenWidth YAScreenSize.width
#define YAScreenHeight YAScreenSize.height


#define YASafeAreaTopHeight (YAScreenHeight >= 812.0 ? 88 : 64)
#define YASafeAreaBottomHeight (YAScreenHeight >= 812.0 ? 78 : 44)
#define YASafeAreaHeight (YAScreenHeight - SafeAreaTopHeight - SafeAreaBottomHeight)

#define YASafeBottomHeight (YAScreenHeight >= 812.0 ? 34 : 0)






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
