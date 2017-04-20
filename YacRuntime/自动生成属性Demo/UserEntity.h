//
//  UserEntity.h
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/20.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject

@property (nonatomic,strong) NSString *profile_image_url;

@property (nonatomic,assign) BOOL vip;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) NSInteger mbrank;

@property (nonatomic,assign) NSInteger mbtype;

@end
