//
//  YAAlertView.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


// 用户传入的回调，处理消息框关闭事件
typedef void (^YAAlertViewOnDismiss)(NSInteger index);

@interface YAAlertView : NSObject
/*
 * 展示一个无按钮消息框，自动延时关闭，并执行回调
 *
 * @prama title: 提示标题
 * @prama message: 提示信息
 * @prama delay: 秒计的延时，0或负时表示默认延时2s
 * @prama onDismiss: 回调block，可以为nil
 */
+ (void)ya_showWithTitle:(NSString *)title
                  message:(NSString *)message
                    delay:(float)delayInSeconds
                onDismiss:(void(^)(void))onDismiss;

/*
 * 展示一个消息框，只有“确定”按钮，并执行回调
 *
 * @prama title: 提示标题
 * @prama message: 提示信息
 * @prama onDismiss: 回调block，可以为nil
 */
+ (void)ya_showWithTitle:(NSString *)title
                  message:(NSString *)message
                onDismiss:(void(^)(void))onDismiss;

/*
 * 展示一个消息框，关闭时执行回调
 *
 * @prama title: 提示标题
 * @prama message: 提示信息
 * @prama ...: 变长参数，0~N个字符串加一个结束符（nil或block），block类型为UIAlertViewOnDismiss
 */
+ (void)ya_showWithTitle:(NSString *)title
                  message:(NSString *)message
      buttonsAndOnDismiss:(NSString *)cancelButtonTitle, ...;








@end

NS_ASSUME_NONNULL_END
