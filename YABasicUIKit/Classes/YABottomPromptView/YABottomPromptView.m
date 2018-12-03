//
//  YABottomPromptView.m
//  YABasicUIKit
//
//  Created by 李亚飞 on 2018/11/30.
//

#import "YABottomPromptView.h"
#import "UIColor+YAColor.h"
#import "UIView+YAFrame.h"

#define kYAPromptScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kYAPromptScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kYAPromptKeyWindow [UIApplication sharedApplication].keyWindow
typedef void (^sureClock)(void);

@interface YABottomPromptView()
@property (strong ,nonatomic) UIView *promptBgView;
@property (strong ,nonatomic) UILabel *promptTitle;
@property (strong ,nonatomic) UILabel *promptContent;
@property (strong ,nonatomic) NSString *title;
@property (strong ,nonatomic) NSString *content;
@property (strong ,nonatomic) NSString *buttonTitle;

@property (strong ,nonatomic) UIButton *sureButton;
@property (strong ,nonatomic) UIButton *cancelButton;


@property (assign ,nonatomic) CGFloat height;

@property (copy ,nonatomic) sureClock sureClock;
@end

@implementation YABottomPromptView


-(instancetype)initWithPromptTitle:(NSString *)title andPromptContent:(NSString *)content andSureButtonTitle:(NSString *)buttonTitle sureHandler:(void (^)(void))sureHandler
{
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
        _buttonTitle = buttonTitle;
        _sureClock = sureHandler;
        [self loadUI];
    }
    return self;
}
-(void)loadUI
{
    self.frame = CGRectMake(0, 0, kYAPromptScreenWidth, kYAPromptScreenHeight);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    self.alpha = 0;
    [kYAPromptKeyWindow addSubview:self];
    //    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)]];
    if ([_title length]) {
        
        self.promptTitle.text = _title;
        
        [self.promptBgView addSubview:self.promptTitle];
    }
    if ([_content length]) {
        
        self.promptContent.text = _content;
        
        [self.promptBgView addSubview:self.promptContent];
    }
    
    if ([_buttonTitle length]) {
        [self.sureButton setTitle:_buttonTitle forState:UIControlStateNormal];
        [self.sureButton setTitle:_buttonTitle forState:UIControlStateHighlighted];
        [self.promptBgView addSubview:self.sureButton];
    }
    UIView *fenGeView = [[UIView alloc]initWithFrame:CGRectMake(0, 176.0, kYAPromptScreenWidth, 10.0)];
    fenGeView.backgroundColor = [UIColor ya_colorForKey:@"F5F5F9"];
    [self.promptBgView addSubview:fenGeView];
    [self.promptBgView addSubview:self.cancelButton];
    
    _height =  kYAPromptScreenHeight >= 812.0 ? 270.0 : 236.0;
    self.promptBgView.height = _height;
    [self addSubview:self.promptBgView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kYAPromptScreenWidth, kYAPromptScreenHeight - self.promptBgView.height)];
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)]];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    
    
}

#pragma mark ==================   LazyLoad   ==================
- (UIView *)promptBgView {
    
    if (!_promptBgView) {
        
        _promptBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kYAPromptScreenHeight, kYAPromptScreenWidth, 0)];
        _promptBgView.backgroundColor = [UIColor whiteColor];
    }
    return _promptBgView;
}

- (UILabel *)promptTitle {
    
    if (!_promptTitle) {
        
        _promptTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 29, kYAPromptScreenWidth, 17.0)];
        _promptTitle.textColor = [UIColor ya_colorForKey:@"333333"];
        _promptTitle.backgroundColor = [UIColor clearColor];
        _promptTitle.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:18];;
        _promptTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _promptTitle;
}

- (UILabel *)promptContent {
    
    if (!_promptContent) {
        
        _promptContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 61, kYAPromptScreenWidth, 12)];
        _promptContent.textColor = [UIColor ya_colorForKey:@"9B9B9B"];
        _promptContent.backgroundColor = [UIColor clearColor];
        _promptContent.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
        _promptContent.textAlignment = NSTextAlignmentCenter;
    }
    return _promptContent;
}

- (UIButton *)sureButton {
    
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sureButton.frame = CGRectMake(63, 108, kYAPromptScreenWidth - 126, 40);
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sureButton setTitleColor:[UIColor ya_colorForKey:@"FFFFFF"] forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor ya_colorForKey:@"FFFFFF"] forState:UIControlStateHighlighted];
        [_sureButton setBackgroundColor:[UIColor ya_colorForKey:@"F98B02"]];
        [_sureButton.layer setCornerRadius:20.0];
        _sureButton.clipsToBounds = YES;
        [_sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelButton.frame = CGRectMake(0, 186, kYAPromptScreenWidth, 50);
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateHighlighted];
        [_cancelButton setTitleColor:[UIColor ya_colorForKey:@"333333"] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor ya_colorForKey:@"333333"] forState:UIControlStateHighlighted];
        [_cancelButton setBackgroundColor:[UIColor ya_colorForKey:@"FFFFFF"]];
        [_cancelButton addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}



- (void)show {
    
    [UIView animateWithDuration:.25 animations:^{
        
        self.promptBgView.bottom = kYAPromptScreenHeight;
        self.alpha = 1;
    }];
}

-(void)remove
{
    [UIView animateWithDuration:.25 animations:^{
        self.promptBgView.top = kYAPromptScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
-(void)sureButtonClick
{
    
    [self remove];
    if (_sureClock) {
        _sureClock();
    }
}

@end
