//
//  NSDictionary+Property.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/20.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "NSDictionary+Property.h"

@implementation NSDictionary (Property)

- (void)createPropertyCode
{
    NSMutableString *codes = [NSMutableString string];
 //遍历字典
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code;
        if ([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) BOOL %@;",key];
        }
        else if ([obj isKindOfClass:[NSNumber class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) NSInteger %@;",key];
        }
        else if ([obj isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",key];
        }
        else if ([obj isKindOfClass:[NSDictionary class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",key];
        }
        [codes appendFormat:@"\n%@\n",code];
    }];
    
    NSLog(@"%@",codes);


}

@end
