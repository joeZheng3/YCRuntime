

//
//  MyEntity.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/20.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyEntity.h"

@implementation MyEntity

//模仿MJExtension
//kvc:模型里的属性要与字典一一对应
+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    MyEntity *entity = [[MyEntity alloc]init];
    
    [entity setValuesForKeysWithDictionary:dict];
    
    //KVC原理
//    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        [entity setValue:obj forKey:key];
//    }];
    
    return entity;
}


//重写kvc的方法，让kvc不报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

@end
