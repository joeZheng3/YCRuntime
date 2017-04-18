//
//  Person.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

//不会生成方法列表
void toEat (id self,SEL _cmd){
    NSLog(@"吃东西");
}

void toRun (id self,SEL _cmd,NSNumber *meter){
    NSLog(@"跑了%@",meter);
}

//动态添加方法或者处理未实现的方法时候调用
//如外界 想实现eat方法，就会传到sel这里来
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%@",NSStringFromSelector(sel));
    
    if (sel == NSSelectorFromString(@"eat")) {
        /*
         <#const char *types#>:这个参数在苹果runtime文档查看,在laguage里查找
         */
        class_addMethod(self, sel,(IMP)toEat, "v@:");
        
        return YES;
    }
    
    if (sel == NSSelectorFromString(@"run:")) {
        
        class_addMethod(self, sel, (IMP)toRun, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
