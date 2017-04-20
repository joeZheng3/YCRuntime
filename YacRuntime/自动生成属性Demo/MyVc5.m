
//
//  MyVc5.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc5.h"
#import "NSDictionary+Property.h"
#import "MyEntity.h"
#import "NSObject+Model.h"


@interface MyVc5 ()

@end

@implementation MyVc5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //假若有一个字典，网络的，本地的也好
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil]];
    //从字典中自动生成属性，方便模型构建
//    [dict createPropertyCode];
//    [dict[@"user"] createPropertyCode];

    
    //字典转模型:KVC或者MJExtension
    MyEntity *entity = [MyEntity modelWithDict:dict];
    
    NSLog(@"%@",entity.pic_urls);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
