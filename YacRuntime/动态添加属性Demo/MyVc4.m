//
//  MyVc4.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc4.h"
#import "NSObject+Property.h"

@interface MyVc4 ()

@end

@implementation MyVc4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //需求：给系统类 NSObject 添加属性，保存一个字符串
    NSObject *objc = [[NSObject alloc]init];
    objc.name = @"123";
    NSLog(@"%@",objc.name);

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
