//
//  XYConfig.m
//  test1
//
//  Created by Xue Yang on 2017/5/4.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "XYConfig.h"

@implementation XYConfig
- (XYConfig * _Nullable (^)(UIColor *))nor_color
{
    NSLog(@"哈哈");
    
    return ^XYConfig *(UIColor *color){
        NSLog(@"%@",color);
        return self;
    };
}
@end
