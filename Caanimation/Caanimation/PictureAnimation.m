//
//  PictureAnimation.m
//  Caanimation
//
//  Created by xrh on 2017/10/17.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "PictureAnimation.h"
#import "UIView+SXAnimation.h"

@interface PictureAnimation () {
    //动画类型
    AnimationType Type;
    //轮播图
    CGFloat startContentOffsetX;
    CGFloat willEndContentOffsetX;
    CGFloat endContentOffsetX;
    UISwipeGestureRecognizer *_leftRecognizer;
    UISwipeGestureRecognizer *_rightRecognizer;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation PictureAnimation

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _index = 0;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width / 1.7)];
    _imageView.image = [UIImage imageNamed:@"111.jpg"];
    [self addSubview:_imageView];
    
    _rightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightHandleSwipeFrom:)];
    [_rightRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self addGestureRecognizer:_rightRecognizer];
    
    _leftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(letfHandleSwipeFrom:)];
    [_leftRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self addGestureRecognizer:_leftRecognizer];

}

- (void)setData:(NSArray *)array {
     _dataArray = array;
}

- (void)rightHandleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    
    if (recognizer == _rightRecognizer) {
        _index --;
        [self setImage];
        [_imageView setAnimationWithType:Type duration:1.0 directionSubtype:SXleft];
    }
}

- (void)letfHandleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer == _leftRecognizer) {
        _index ++;
        [self setImage];
        [_imageView setAnimationWithType:Type duration:1.0 directionSubtype:SXright];
    }
}

/**
  types
  CA_EXTERN NSString * const kCATransitionFade
  CA_EXTERN NSString * const kCATransitionMoveIn
  CA_EXTERN NSString * const kCATransitionPush
  CA_EXTERN NSString * const kCATransitionReveal

  subtypes
  CA_EXTERN NSString * const kCATransitionFromRight
  CA_EXTERN NSString * const kCATransitionFromLeft
  CA_EXTERN NSString * const kCATransitionFromTop
  CA_EXTERN NSString * const kCATransitionFromBottom
 */
#pragma mark -- 按钮点击事件
- (void)buttonAction:(UIButton *)button {
    if (button.tag == 100) {
        _index --;
        [self setImage];
        [self setCATransition:kCATransitionFromTop];
    } else{
        _index ++;
        [self setImage];
        [self setCATransition:kCATransitionFromBottom];
    }
}

- (void)setImage {
    NSInteger count = _dataArray.count - 1;
    NSLog(@"_index == %ld count == %ld",(long)_index,count);
    if (_index > count) {
        _index = 0;
    }
    if (_index < 0) {
        _index = _dataArray.count - 1;
    }
    _imageView.image = [UIImage imageNamed:[_dataArray objectAtIndex:_index]];
}

- (void)setCATransition:(NSString *)subtype {
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";
    anima.subtype = subtype;
    anima.duration = 0.8;
    [_imageView.layer addAnimation:anima forKey:@"revealAnimation"];
}

@end
