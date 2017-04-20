//
//  MyEntity.h
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/20.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserEntity;
//使用KVC字典转模型
@interface MyEntity : NSObject

@property (nonatomic,strong) NSString *source;

@property (nonatomic,assign) NSInteger reposts_count;

@property (nonatomic,strong) NSArray *pic_urls;

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,assign) BOOL isA;

@property (nonatomic,assign) NSInteger attitudes_count;

@property (nonatomic,strong) NSString *idstr;

@property (nonatomic,strong) NSString *text;

@property (nonatomic,assign) NSInteger comments_count;

@property (nonatomic,strong) UserEntity *user;

+ (instancetype)itemWithDict:(NSDictionary*)dict;

@end
