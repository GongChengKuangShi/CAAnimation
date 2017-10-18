//
//  ViewController.m
//  Caanimation
//
//  Created by xrh on 2017/10/17.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ViewController.h"
#import "PictureAnimation.h"
#import "UIView+SXAnimation.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    //动画类型
    AnimationType Type;
    //轮播图
    UIScrollView * scroll ;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PictureAnimation *pic = [[PictureAnimation alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    [self.view addSubview:pic];
    [pic setData:@[@"111.jpg",@"112.jpg",@"113.jpg",@"114.jpg"]];
}


@end
