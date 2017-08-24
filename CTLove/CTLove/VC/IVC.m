//
//  IVC.m
//  CTLove
//
//  Created by wenjie on 2017/8/21.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "IVC.h"
#import "IIVC.h"

@interface IVC ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation IVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startAnimation];
}

- (void)setupUI{
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-self.view.frame.size.height/2-400);
        make.height.equalTo(@400);
    }];
    
    [self.view addSubview:self.titleLb];
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@60);
        make.centerY.equalTo(self.view.mas_centerY).offset(-200-30-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(self.view.frame.size.width);
    }];
    
}

- (void)startAnimation{
    
    [self.imageV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.titleLb mas_updateConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.view);
        }];
        [UIView animateWithDuration:1 animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
    
}

- (void)push{
    IIVC *nextVC = [IIVC new];
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型为立方体动画
    animation.type = @"cube";
    //设置动画时长
    animation.duration =0.5f;
    //设置运动的方向
    animation.subtype =kCATransitionFromRight;
    //控制器间跳转动画
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:nextVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImageView *)imageV{
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageV.image = [UIImage imageNamed:@"1_1"];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageV;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:30];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.text = @"彼岸流年，苍白了岁月，苍老等待，直到我遇见你!";
    }
    return _titleLb;
}


@end
