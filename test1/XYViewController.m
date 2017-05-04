//
//  XYViewController.m
//  test1
//
//  Created by Xue Yang on 2017/5/4.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "XYViewController.h"

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"leftVC";
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%@",self);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
