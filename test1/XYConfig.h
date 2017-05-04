//
//  XYConfig.h
//  test1
//
//  Created by Xue Yang on 2017/5/4.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XYConfig : NSObject
- (XYConfig *(^)(UIColor *color))nor_color;
@end
