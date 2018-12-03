//
//  YAAlertViewAlertViewOne.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/12/3.
//

#import "YAAlertViewAlertViewOne.h"
#import <PureLayout/PureLayout.h>
#import "UILabel+YASetContent.h"
#import "UIColor+YAColor.h"
#import "UIFont+YAFontType.h"
#import "UIImage+YACreate.h"


typedef void (^cancel)(void);
typedef void (^choose)(void);

#define kYAAlertScreenWidth                     ([UIScreen mainScreen].bounds.size.width)
#define kYAAlertScreenAutoLayoutScale           (kYAAlertScreenWidth / 375)
#define kYAAlertScreenAutoLayoutScaleCeil(x)    ceilf(kYAAlertScreenAutoLayoutScale*(x))



typedef NS_ENUM(NSUInteger, YAAlertViewOneTyle) {
    YAAlertViewOneTypeDefult = 0, // 没有标题
    YAAlertViewOneTypeHasTitle, // 有标题
    YAAlertViewOneTypeHasTitleAndImage, // 有标题和图片
};
@interface YAAlertViewAlertViewOne()

@property (nonatomic, assign) YAAlertViewOneTyle alertViewType;

/**
 白色背景
 */
@property (nonatomic, strong) UIView *contentView;

//@property (nonatomic, strong) UIImageView *imageView;
/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 弹框内容
 */
@property (nonatomic, strong) UILabel *messageLabel;

/**
 确定按钮
 */
@property (nonatomic, strong) UIButton *defultButton;

/**
 取消按钮
 */
@property (nonatomic, strong) UIButton *cancelButton;

/**
 有取消按钮时，分隔取消按钮与确定按钮的竖线
 */
@property (nonatomic, strong) UIView *centerLineView;

/**
 内容与按钮的分界线
 */
@property (nonatomic, strong) UIView *lineView;

/**
 alert样式
 */
@property (nonatomic, assign) YAAlertViewOneStyle alertViewStyle;
@property (nonatomic, assign) BOOL isSettingMessageTextAlignment;

@property (nonatomic, copy) choose confirmParam;
@property (nonatomic, copy) cancel cancleParam;

@end



@implementation YAAlertViewAlertViewOne


- (instancetype)init {
    if (self = [super init]) {
        
        [self drawAlertView];
        
    }
    return self;
}

- (void)alertActionStyle:(YAAlertViewOneStyle)alertViewStyle message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler {
    
    _alertViewStyle = alertViewStyle;
    
    if (_alertViewStyle == YAAlertViewOneStyleCancel) {
        
        [self addCancelButton];
    }
    
    [self setNeedsUpdateConstraints];
    
    _messageLabel.text = message;
    [UILabel ya_changeLineSpaceForLabel:_messageLabel lineSpace:4];
    if (self.messageTextAlignment != NSTextAlignmentCenter && self.isSettingMessageTextAlignment) {
        _messageLabel.textAlignment = self.messageTextAlignment;
    } else {
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    [_defultButton setTitle:defultTitle forState:(UIControlStateNormal)];
    _confirmParam = defultHandler;
    
    [_cancelButton setTitle:cancelTitle forState:(UIControlStateNormal)];
    _cancleParam = cancelHandler;
    
}

- (void)ya_alertActionStyle:(YAAlertViewOneStyle)alertViewStyle title:(NSString *)title message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler {
    
    [self drawAlertViewContainsTitleLabel];
    
    _titleLabel.text = title;
    
    [self alertActionStyle:alertViewStyle message:message defultTitle:defultTitle defultHandler:defultHandler cancelTitle:cancelTitle cancelHandler:cancelHandler];
    
    _alertViewType = YAAlertViewOneTypeHasTitle;
}

- (void)alertActionStyle:(YAAlertViewOneStyle)alertActionStyle image:(id)image title:(NSString *)title message:(NSString *)message defultTitle:(NSString *)defultTitle defultHandler:(void (^)(void))defultHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(void))cancelHandler {
    
    [self drawAlertViewContainsTitleLabelAndImage];
    
    if ([image isKindOfClass:[UIImage class]]) {
        UIImage *picImage = (UIImage *)image;
        _imageView.image = picImage;
    }
    //这句需要继承SDWebImage才能打开
//    if ([image isKindOfClass:[NSString class]]) {
//        NSString *picString = (NSString *)image;
//        [_imageView sd_setImageWithURL:[NSURL URLWithString:picString]];
//    }
    
    if ([image isKindOfClass:[NSData class]]) {
        NSData *data = (NSData *)image;
        _imageView.image = [UIImage imageWithData:data];
    }
    
    [self alertActionStyle:alertActionStyle title:title message:message defultTitle:defultTitle defultHandler:defultHandler cancelTitle:cancelTitle cancelHandler:cancelHandler];
    
    _alertViewType = YAAlertViewOneTypeHasTitleAndImage;
    
}

- (void)updateConstraints {
    
    [self autoPinEdgesToSuperviewEdges];
    
    [_contentView autoSetDimension:(ALDimensionWidth) toSize:kYAAlertScreenAutoLayoutScaleCeil(270.0)];
    [_contentView autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_contentView autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    
    if (_alertViewType == YAAlertViewOneTypeDefult) {
        
        [_messageLabel autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView withOffset:-(37 * 2)];
        [_messageLabel autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        [_messageLabel autoPinEdgeToSuperviewEdge:(ALEdgeTop) withInset:24];
        [_messageLabel autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:68];
        
    } else if (_alertViewType == YAAlertViewOneTypeHasTitle) {
        
        [_titleLabel autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView withOffset:-(37 * 2)];
        [_titleLabel autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        [_titleLabel autoPinEdgeToSuperviewEdge:(ALEdgeTop) withInset:21];
        
        [_messageLabel autoAlignAxis:(ALAxisVertical) toSameAxisOfView:_titleLabel];
        [_messageLabel autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_titleLabel];
        [_messageLabel autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeBottom) ofView:_titleLabel withOffset:11];
        [_messageLabel autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:65];
        
    } else if (_alertViewType == YAAlertViewOneTypeHasTitleAndImage) {
        
        [_imageView autoSetDimensionsToSize:(CGSizeMake(90, 90))];
        [_imageView autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        [_imageView autoPinEdgeToSuperviewEdge:(ALEdgeTop) withInset:43];
        
        [_titleLabel autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView withOffset:-(37 * 2)];
        [_titleLabel autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        [_titleLabel autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeBottom) ofView:_imageView withOffset:28];
        
        [_messageLabel autoAlignAxis:(ALAxisVertical) toSameAxisOfView:_titleLabel];
        [_messageLabel autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_titleLabel];
        [_messageLabel autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeBottom) ofView:_titleLabel withOffset:11];
        [_messageLabel autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:65];
        
    }
    
    [_lineView autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:43.5];
    [_lineView autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView];
    [_lineView autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_lineView autoSetDimension:(ALDimensionHeight) toSize:0.5];
    
    if (_alertViewStyle == YAAlertViewOneStyleDefult) {
        
        [_defultButton autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView];
        [_defultButton autoSetDimension:(ALDimensionHeight) toSize:43.5];
        [_defultButton autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        [_defultButton autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:0];
        
    } else {
        
        [_defultButton autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_contentView withMultiplier:0.5];
        [_defultButton autoSetDimension:(ALDimensionHeight) toSize:43.5];
        [_defultButton autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:0];
        [_defultButton autoPinEdgeToSuperviewEdge:(ALEdgeRight) withInset:0];
        
        [_cancelButton autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:_defultButton];
        [_cancelButton autoMatchDimension:(ALDimensionHeight) toDimension:(ALDimensionHeight) ofView:_defultButton];
        [_cancelButton autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_defultButton];
        [_cancelButton autoPinEdgeToSuperviewEdge:(ALEdgeLeft) withInset:0];
        
        [_centerLineView autoPinEdgeToSuperviewEdge:(ALEdgeBottom) withInset:0];
        [_centerLineView autoMatchDimension:(ALDimensionHeight) toDimension:(ALDimensionHeight) ofView:_defultButton];
        [_centerLineView autoSetDimension:(ALDimensionWidth) toSize:0.5];
        [_centerLineView autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
        
    }
    
    [super updateConstraints];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _contentView.layer.cornerRadius = 8;
    
}


- (void)defultButtonClick {
    [self dismiss];
    if (_confirmParam) {
        _confirmParam();
    }
}

- (void)cancelButtonClick {
    [self dismiss];
    if (_cancleParam) {
        _cancleParam();
    }
}

- (void)drawAlertViewContainsTitleLabelAndImage {
    
    _imageView = [UIImageView newAutoLayoutView];
    _imageView.backgroundColor = [UIColor ya_colorForKey:@"e6e6e6"];
    [_contentView addSubview:_imageView];
    
    _messageLabel.font = [UIFont ya_normalFontOfSize:14];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.textColor = [UIColor ya_colorForKey:@"999999"];
}

- (void)drawAlertViewContainsTitleLabel {
    
    _titleLabel = [UILabel newAutoLayoutView];
    _titleLabel.textColor = [UIColor ya_colorForKey:@"333333"];
    _titleLabel.font = [UIFont ya_normalFontOfSize:16];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 0;
    [_contentView addSubview:_titleLabel];
    
    _messageLabel.font = [UIFont ya_normalFontOfSize:14];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)addCancelButton {
    
    _cancelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_cancelButton setTitleColor:[UIColor ya_colorForKey:@"666666"] forState:(UIControlStateNormal)];
    _cancelButton.titleLabel.font = [UIFont ya_boldFontOfSize:16];
    [_cancelButton setBackgroundImage:[UIImage ya_imageWithColor:[UIColor whiteColor]] forState:(UIControlStateNormal)];
    [_cancelButton setBackgroundImage:[UIImage ya_imageWithColor:[UIColor ya_colorForKey:@"eeeeee"]] forState:(UIControlStateHighlighted)];
    _cancelButton.clipsToBounds = YES;
    [_contentView addSubview:_cancelButton];
    [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    _centerLineView = [UIView newAutoLayoutView];
    _centerLineView.backgroundColor = [UIColor ya_colorForKey:@"eeeeee"];
    [_contentView addSubview:_centerLineView];
}

- (void)drawAlertView {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    //    [self addGestureRecognizer:tap];
    
    _contentView = [UIView newAutoLayoutView];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.clipsToBounds = YES;
    [self addSubview:_contentView];
    
    _messageLabel = [UILabel newAutoLayoutView];
    _messageLabel.textColor = [UIColor ya_colorForKey:@"999999"];
    _messageLabel.font = [UIFont ya_normalFontOfSize:16];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.numberOfLines = 0;
    [_contentView addSubview:_messageLabel];
    
    _lineView = [UIView newAutoLayoutView];
    _lineView.backgroundColor = [UIColor ya_colorForKey:@"eeeeee"];
    [_contentView addSubview:_lineView];
    
    _defultButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_defultButton setTitleColor:[UIColor ya_colorForKey:@"999999"] forState:(UIControlStateNormal)];
    _defultButton.titleLabel.font = [UIFont ya_normalFontOfSize:16];
    [_defultButton setBackgroundImage:[UIImage ya_imageWithColor:[UIColor whiteColor]] forState:(UIControlStateNormal)];
    [_defultButton setBackgroundImage:[UIImage ya_imageWithColor:[UIColor ya_colorForKey:@"eeeeee"]] forState:(UIControlStateHighlighted)];
    _defultButton.clipsToBounds = YES;
    [_contentView addSubview:_defultButton];
    [_defultButton addTarget:self action:@selector(defultButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)dismiss {
    [self removeFromSuperview];
}



- (void)setTitleTextFont:(UIFont *)titleTextFont {
    if (titleTextFont && _titleLabel) {
        _titleLabel.font = titleTextFont;
    }
}

- (void)setTitleTextColor:(UIColor *)titleTextColor {
    if (titleTextColor && _titleLabel) {
        _titleLabel.textColor = titleTextColor;
    }
}

- (void)setMessageTextFont:(UIFont *)messageTextFont {
    if (messageTextFont && _messageLabel) {
        _messageLabel.font = messageTextFont;
    }
}

- (void)setMessageTextColor:(UIColor *)messageTextColor {
    if (messageTextColor && _messageLabel) {
        _messageLabel.textColor = messageTextColor;
    }
}

- (void)setDefultBtnTextFont:(UIFont *)defultBtnTextFont {
    if (defultBtnTextFont && _defultButton) {
        _defultButton.titleLabel.font = defultBtnTextFont;
    }
}

- (void)setDefultBtnTextColor:(UIColor *)defultBtnTextColor {
    if (defultBtnTextColor && _defultButton) {
        [_defultButton setTitleColor:defultBtnTextColor forState:(UIControlStateNormal)];
    }
}

- (void)setCancelBtnTextFont:(UIFont *)cancelBtnTextFont {
    if (cancelBtnTextFont && _cancelButton) {
        _cancelButton.titleLabel.font = cancelBtnTextFont;
    }
}

- (void)setCancelBtnTextColor:(UIColor *)cancelBtnTextColor {
    if (cancelBtnTextColor && _cancelButton) {
        [_cancelButton setTitleColor:cancelBtnTextColor forState:(UIControlStateNormal)];
    }
}

- (void)setTitleTextAlignment:(NSTextAlignment)titleTextAlignment {
    _titleLabel.textAlignment = titleTextAlignment;
}

- (void)setMessageTextAlignment:(NSTextAlignment)messageTextAlignment {
    _messageLabel.textAlignment = messageTextAlignment;
    _isSettingMessageTextAlignment = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
