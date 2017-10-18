//
//  UIView+SXAnimation.h
//  Caanimation
//
//  Created by xrh on 2017/10/17.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  动画类型
 */
typedef enum{
    
    SXpageCurl,               // 向上翻一页
    SXpageUnCurl,              //向下翻一页
    SXrippleEffect,            //波纹
    SXsuckEffect,              //吸收
    SXcube,                    //立方体
    SXoglFlip,                 //翻转
    SXcameraIrisHollowOpen,    //镜头开
    SXcameraIrisHollowClose,   //镜头关
    SXfade,                    //翻页
    SXmovein,                  //弹出
    SXpush                     //推出
    
}AnimationType;

/**
 *  动画方向
 */
typedef enum{
    SXleft,                 //左
    SXright,                //右
    SXtop,                  //顶部
    SXbottom,               //底部
    SXmiddle
    
}Direction;

@interface UIView (SXAnimation)

/**
 *  动画设置
 *
 *  @param animation    动画
 *  @param durationTime 动画时间
 *  @param subtype      过渡方向
 */
- (void)setAnimationWithType:(AnimationType)animation
                    duration:(float)durationTime
            directionSubtype:(Direction)subtype;


@end
