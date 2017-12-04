//
//  YACellItem.h
//  YABasicUIKit_Example
//
//  Created by 郦道元  on 2017/12/4.
//  Copyright © 2017年 OneAlon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YACellItem : NSObject

@property(nonatomic)Class vcClass;
@property(nonatomic,copy)NSString *title;

-(instancetype)initWithTitle:(NSString *)title vcClass:(Class)vcClass;

@end
