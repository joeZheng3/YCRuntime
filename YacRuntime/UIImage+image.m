//
//  UIImage+image.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "UIImage+image.h"
#import <objc/message.h>

@implementation UIImage (image)

//在load方法里添加runtime交换方法 保证一开始方法交换成功,否则不生效
+ (void)load
{
  //获取imageNamed方法
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
  //获取yac_imageNamed方法
    Method yac_imageNamed = class_getClassMethod(self, @selector(yac_imageNamed:));
  //交换方法
    method_exchangeImplementations(imageNamed, yac_imageNamed);
}

//多次调用 swift中使用
//+ (void)initialize
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//}


+ (nullable UIImage *)yac_imageNamed:(NSString *)name;
{
    UIImage *image = [UIImage yac_imageNamed:@""];
    
    if (image == nil)
    {
        NSLog(@"加载失败");
    }
    else
    {
        NSLog(@"加载成功");
    }
    
    return image;
    
}

@end
