//
//  ViewController.m
//  test1
//
//  Created by Xue Yang on 2017/4/17.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "ViewController.h"
#import "XYConfig.h"
#import <MMDrawerController.h>
#import "XYViewController.h"
#import "MMExampleDrawerVisualStateManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"centerVC";
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (void)dealloc {
    NSLog(@"%@",self);
}
- (IBAction)c:(id)sender {
    ViewController *centerVC = [ViewController new];

    
    XYViewController *leftVC = [XYViewController new];
    
    
    MMDrawerController *drawVC = [[MMDrawerController alloc] initWithCenterViewController:centerVC leftDrawerViewController:leftVC];
    
    drawVC.navigationItem.title = @"drawVC";
    //设置滑动centerView打开抽屉
    [drawVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningCenterView];
    drawVC.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView | MMCloseDrawerGestureModeTapCenterView;
    
    
    [drawVC setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        
        CATransform3D transform = CATransform3DIdentity;
        UIViewController * sideDrawerViewController;
        if(drawerSide == MMDrawerSideLeft) {
            sideDrawerViewController = drawerController.leftDrawerViewController;
            //取最大值
            CGFloat distance = MAX(drawerController.maximumLeftDrawerWidth,drawerController.visibleLeftDrawerWidth);
            CGFloat parallaxFactor = 2.0f;
            if (percentVisible <= 1.f) {
                //3D 转化
                transform = CATransform3DMakeTranslation((-distance) * (1 - percentVisible) / parallaxFactor, 0.0, 0.0);
            }
            else{
                transform = CATransform3DMakeScale(percentVisible, 1.f, 1.f);
                transform = CATransform3DTranslate(transform, drawerController.maximumLeftDrawerWidth*(percentVisible-1.f)/2, 0.f, 0.f);
//                transform = CATransform3DIdentity;
            }
             [sideDrawerViewController.view.layer setTransform:transform];
        }
        //centerVC大小缩放
        centerVC.view.layer.transform = CATransform3DMakeScale(1, 1 - percentVisible/10, 1);
    }];

    //左右 控制器打开的效果 这里设置了 视觉差 效果
//    [drawVC
//     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//         MMDrawerControllerDrawerVisualStateBlock block;
//         //左边/右边 控制器 view 的变化效果
//         block = [[MMExampleDrawerVisualStateManager sharedManager]
//                  drawerVisualStateBlockForDrawerSide:drawerSide];
//         if(block){
//             block(drawerController, drawerSide, percentVisible);
//         }
//     }];
    
    [self.navigationController pushViewController:drawVC animated:YES];
}

@end
