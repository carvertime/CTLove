//
//  BaseVC.m
//  CTLove
//
//  Created by wenjie on 2017/8/24.
//  Copyright © 2017年 Demo. All rights reserved.
//

/**
Fade = 1,                   //淡入淡出
Push,                       //推挤
Reveal,                     //揭开
MoveIn,                     //覆盖
Cube,                       //立方体
SuckEffect,                 //吮吸
OglFlip,                    //翻转
RippleEffect,               //波纹
PageCurl,                   //翻页
PageUnCurl,                 //反翻页
CameraIrisHollowOpen,       //开镜头
CameraIrisHollowClose,      //关镜头
CurlDown,                   //下翻页
CurlUp,                     //上翻页
FlipFromLeft,               //左翻转
 
*/

#import "BaseVC.h"
#import <Masonry.h>

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view);
        make.height.width.equalTo(@100);
    }];
    
    [self.nextBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)nextBtn{
    if (_nextBtn == nil) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_nextBtn setTitle:@"next" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _nextBtn.backgroundColor = LCRedColor;
        _nextBtn.layer.cornerRadius = 50;
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    }
    return _nextBtn;
}

@end
