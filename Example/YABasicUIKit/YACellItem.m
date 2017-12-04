//
//  YACellItem.m
//  YABasicUIKit_Example
//
//  Created by 郦道元  on 2017/12/4.
//  Copyright © 2017年 OneAlon. All rights reserved.
//

#import "YACellItem.h"

@implementation YACellItem
-(instancetype)initWithTitle:(NSString *)title vcClass:(Class)vcClass
{
    if (self = [super init]) {
        _title = title;
        _vcClass = vcClass;
    }
    return self;
}
@end
