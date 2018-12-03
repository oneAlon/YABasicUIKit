//
//  YACommonMethods.h
//  Pods
//
//  Created by 李亚飞 on 2018/10/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum  {
    
    kGradientTypeTopToBottom = 0,       //从上到下
    kGradientTypeTopLeftToRigh,         //从左到右
    kGradientTypeUpleftToLowright,      //左上到右下
    kGradientTypeUprightToLowleft,      //右上到左下
    
} YAGradientType;


@interface YACommonMethods : NSObject

/**
 判断为空
 
 @param obj 传入的数据
 @return 结果
 */
+ (BOOL)ya_isEmpty:(id)obj;


/**
 是否拥有相机
 
 @return 是否拥有  YES/NO
 */
+ (BOOL)ya_isHasCamera;

/**
 检测相册是否开启
 
 @return YES/NO
 */
+ (BOOL)ya_albumOpen;


/**
 检测相机是否开启
 
 @return YES/NO
 */
+ (BOOL)ya_cameraOpen;

/**
 通过时间戳得到时间
 
 @param stamp 时间戳
 @param formatter 格式
 @return 时间
 */
+ (NSString *)ya_getTimebyStamp:(NSString *)stamp andFormatter:(NSString *)formatter;

/**
 修正浮点型精度丢失
 
 @param precisionString 传入接口取到的数据
 @return 修正精度后的数据
 */
+(NSString *)ya_repairPrecisionString:(NSString *)precisionString;


/**
 计算UILabel的高度(带有行间距的情况)
 
 @param labelStr label的内容
 @param font  label的字体大小
 @param width label的宽度
 @return 修正精度后的数据
 */

+(CGFloat)ya_getSpaceLabelHeightWithLabelStr:(NSString*)labelStr withFont:(UIFont*)font withWidth:(CGFloat)width;

/**
 十六进制字符串转颜色
 
 @param stringToConvert 十六进制
 @return RGB颜色
 */
+ (UIColor *)ya_colorWithHexString:(NSString *)stringToConvert;

/**
 十六进制字符串转颜色
 
 @param stringToConvert 十六进制
 @param alpha 透明度
 @return RGB颜色
 */
+ (UIColor *)ya_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

/**
 根据颜色自动生成图片
 
 @param color color
 @return 生成的图片
 */
+ (UIImage *)ya_generateImageWithColor:(UIColor *)color;

/**
 用颜色填充成一张图片
 
 @param color 颜色
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)ya_getImageByColor:(UIColor *)color andSize:(CGSize)size;



/**
 用颜色生成一张渐变图片
 
 @param colorsArray 颜色组
 @param gradientType 渐变位置
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)ya_getImageByColors:(NSArray <UIColor *> *)colorsArray andGradientType:(YAGradientType)gradientType andImageSize:(CGSize)size;






@end

NS_ASSUME_NONNULL_END
