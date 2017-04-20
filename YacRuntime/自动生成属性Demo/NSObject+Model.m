
//
//  NSObject+Model.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/20.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)

//核心思想:把字典的所有值给模型属性赋值
//  class_copyMethodList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
//    class_copyPropertyList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
+ (instancetype)modelWithDict:(NSDictionary*)dict
{
    id objc = [[self alloc]init];
   //runtime:根据模型中的属性，去字典中的取出对应的value给模型属性赋值

    unsigned int count = 0;
    //获取成员变量数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    //遍历所有成员变量名字
    for (int i = 0; i<count; i++) {
        //获取成员变量
        Ivar ivar = ivarList[i];
        
        //获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //获取key
        NSString *key = [ivarName substringFromIndex:1];
        
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        //去字典查找对应的value
        id value = dict[key];
        
        //递归二级转换：判断value是否为字典
        //并且是自定义对象，才需要将字典转换
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {

            //获取类
            Class modelClass = NSClassFromString(ivarType);
            
            value = [modelClass modelWithDict:value];
            
        }
        
        //给模型中的属性赋值
        if (value) {
            [objc setValue:value forKey:key];
        }
        
    }
    return objc;
}

@end
