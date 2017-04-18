//
//  MyVc3.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc3.h"
#import "Person.h"

@interface MyVc3 ()

@end

@implementation MyVc3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //_cmd:当前方法的编号
    //打印当前方法
//    NSLog(@"%@",NSStringFromSelector(_cmd));

    
    Person *p = [[Person alloc]init];
    
    //动态添加方法
    //不带参数
    [p performSelector:@selector(eat)];
    //带参数的
    [p performSelector:@selector(run:) withObject:@10];
    
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
