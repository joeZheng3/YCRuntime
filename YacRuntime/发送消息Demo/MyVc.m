//
//  MyVc.m
//  YacRuntime
//
//  Created by ChangWingchit on 2017/4/18.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc.h"
#import "Human.h"
#import <objc/message.h>

@interface MyVc ()

@end

@implementation MyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //使用runtime创建对象
//    id objc = [NSObject alloc];
//    objc = [objc init];
    
//    objc_msgSend([Human class], @selector(alloc));
    
    //创建
    Human *h = objc_msgSend(objc_getClass("Human"), sel_registerName("alloc"));
    
    h = objc_msgSend(h, sel_registerName("init"));
    
    //方法调用
    objc_msgSend(h, @selector(eat));
    
    objc_msgSend(h, @selector(run:),10);
    
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
