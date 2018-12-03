//
//  YABottomPromptView.h
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YABottomPromptView : UIView

/**
 初始化成功以后,需要调用show来显示
 
 @param title  提示标题
 @param content 提示具体内容
 @param buttonTitle 确定按钮标题
 @param sureHandler 确定按钮回调
 @return BottomPromptView(界面)
 */

-(instancetype)initWithPromptTitle:(NSString *)title andPromptContent:(NSString *)content andSureButtonTitle:(NSString *)buttonTitle sureHandler:(void (^)(void))sureHandler;

- (void)show;

@end

NS_ASSUME_NONNULL_END
