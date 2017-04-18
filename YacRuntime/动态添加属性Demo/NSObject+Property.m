//
//  NSObject+Property.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>

@implementation NSObject (Property)

- (void)setName:(NSString *)name
{
    /*
       object:给哪个对象添加属性
       key:属性名称
       value:属性值
       policy:保存的策略
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


- (NSString*)name
{
    return objc_getAssociatedObject(self, @"name");
}

@end
