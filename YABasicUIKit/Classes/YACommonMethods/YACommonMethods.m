//
//  YACommonMethods.m
//  Pods
//
//  Created by 李亚飞 on 2018/10/11.
//

#import "YACommonMethods.h"
#import <sys/utsname.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@implementation YACommonMethods

/**
 判断为空
 
 @param obj 传入的数据
 @return 结果
 */
+ (BOOL)ya_isEmpty:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return YES;
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        
        NSString *trimStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([trimStr isEqualToString:@""] || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"]) {
            return YES;
        }
    } else if ([obj respondsToSelector:@selector(length)]
               && [(NSData *)obj length] == 0) {
        return YES;
    } else if ([obj respondsToSelector:@selector(count)]
               && [(NSArray *)obj count] == 0) {
        return YES;
    }
    return NO;
}

/**
 检测相册是否开启
 
 @return YES/NO
 */
+ (BOOL)ya_albumOpen {
    
    AVAuthorizationStatus authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authorizationStatus == AVAuthorizationStatusRestricted || authorizationStatus == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

/**
 是否拥有相机
 
 @return 是否拥有  YES/NO
 */
+ (BOOL)ya_isHasCamera {
    
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
/**
 检测相机是否开启
 
 @return YES/NO
 */
+ (BOOL)ya_cameraOpen {
    
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (videoAuthStatus == AVAuthorizationStatusRestricted || videoAuthStatus == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

/**
 通过时间戳得到时间
 
 @param stamp 时间戳
 @param formatter 格式
 @return 时间
 */
+ (NSString *)ya_getTimebyStamp:(NSString *)stamp andFormatter:(NSString *)formatter {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[stamp doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}


/**
 修正浮点型精度丢失
 
 @param precisionString 传入接口取到的数据
 @return 修正精度后的数据
 */
+(NSString *)ya_repairPrecisionString:(NSString *)precisionString
{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [precisionString doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
    
}

/**
 计算UILabel的高度(带有行间距的情况)
 
 @param labelStr label的内容
 @param font  label的字体大小
 @param width label的宽度
 @return 修正精度后的数据
 */

+(CGFloat )ya_getSpaceLabelHeightWithLabelStr:(NSString*)labelStr withFont:(UIFont*)font withWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 8;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    CGSize size = [labelStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}

/**
 十六进制字符串转颜色
 
 @param stringToConvert 十六进制
 @return RGB颜色
 */
+ (UIColor *)ya_colorWithHexString:(NSString *)stringToConvert {
    
    return  [self ya_colorWithHexString:stringToConvert alpha:1];
}


/**
 十六进制字符串转颜色
 
 @param stringToConvert 十六进制
 @param alpha 透明度
 @return RGB颜色
 */
+ (UIColor *)ya_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha{
    
    if (!stringToConvert.length) {
        return [UIColor clearColor];
    }
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat) r / 255.0f) green:((CGFloat) g / 255.0f) blue:((CGFloat) b / 255.0f) alpha:alpha];
}


/**
 根据颜色自动生成图片
 
 @param color color
 @return 生成的图片
 */
+ (UIImage *)ya_generateImageWithColor:(UIColor *)color {
    
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 用颜色填充成一张图片
 
 @param color 颜色
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)ya_getImageByColor:(UIColor *)color andSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


/**
 用颜色生成一张渐变图片
 
 @param colorsArray 颜色组
 @param gradientType 渐变位置
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)ya_getImageByColors:(NSArray <UIColor *> *)colorsArray andGradientType:(YAGradientType)gradientType andImageSize:(CGSize)size {
    
    NSMutableArray *colors = [NSMutableArray array];
    for(UIColor *color in colorsArray) {
        [colors addObject:(id)color.CGColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colorsArray lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, NULL);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case kGradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        case kGradientTypeTopLeftToRigh:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, 0.0);
            break;
        case kGradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case kGradientTypeUprightToLowleft:
            start = CGPointMake(size.width, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return image;
}











@end
