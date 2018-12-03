//
//  YAAlertViewAlertViewOne.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YAAlertViewOneStyle) {
    YAAlertViewOneStyleDefult = 0, // 只有一个按钮时
    YAAlertViewOneStyleCancel // 包含取消按钮
};


@interface YAAlertViewAlertViewOne : UIView
@property (nonatomic, strong) UIColor *titleTextColor;
@property (nonatomic, strong) UIFont *titleTextFont;

@property (nonatomic, strong) UIColor *messageTextColor;
@property (nonatomic, strong) UIFont *messageTextFont;

@property (nonatomic, strong) UIColor *defultBtnTextColor;
@property (nonatomic, strong) UIFont *defultBtnTextFont;

@property (nonatomic, strong) UIColor *cancelBtnTextColor;
@property (nonatomic, strong) UIFont *cancelBtnTextFont;

@property (nonatomic) NSTextAlignment titleTextAlignment; // 默认居中
@property (nonatomic) NSTextAlignment messageTextAlignment; // 默认居中

@property (nonatomic, strong) UIImageView *imageView;

- (void)alertActionStyle:(YAAlertViewOneStyle)alertActionStyle message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler;

- (void)alertActionStyle:(YAAlertViewOneStyle)alertActionStyle title:(NSString *)title message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler;

- (void)alertActionStyle:(YAAlertViewOneStyle)alertActionStyle image:(id)image title:(NSString *)title message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler;






@end

NS_ASSUME_NONNULL_END
