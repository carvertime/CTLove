//
//  IIVC.m
//  CTLove
//
//  Created by wenjie on 2017/8/23.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "IIVC.h"
#import "IIIVC.h"

@interface IIVC ()

@property (nonatomic, strong) UIImageView *leftImageV;
@property (nonatomic, strong) UIImageView *rightImageV;
@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation IIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setpUI];
}

- (void)setpUI{
    
    [self.view addSubview:self.leftImageV];
    [self.view addSubview:self.rightImageV];
    [self.view addSubview:self.titleLb];
    
    [self.leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.width.height.equalTo(@200);
        make.left.equalTo(self.view.mas_left).offset(-200);
    }];
    
    [self.rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.height.equalTo(@200);
        make.right.equalTo(self.view.mas_right).offset(200);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@60);
        make.centerY.equalTo(self.view.mas_centerY).offset(self.view.frame.size.height*0.5+30);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
}

- (void)startAnimation{
    
    [self.leftImageV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
    }];
    [self.rightImageV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
    }];
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self animation2];
    }];
    
}

- (void)animation2{
    [self.leftImageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.width.height.equalTo(@200);
        make.centerX.equalTo(self.view).offset(-100-20);
    }];
    
    [self.rightImageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.width.height.equalTo(@200);
        make.centerX.equalTo(self.view).offset(100+20);
    }];
    
    [self.titleLb mas_updateConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(self.view.mas_centerY).offset(-100-30-50);
    }];
    
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
}

- (void)push{
    IIIVC *nextVC = [IIIVC new];
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型为立方体动画
    animation.type = @"fade";
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

- (UIImageView *)leftImageV{
    if (_leftImageV == nil) {
        _leftImageV = [[UIImageView alloc] initWithFrame:CGRectZero];
        _leftImageV.image = [UIImage imageNamed:@"2_1"];
    }
    return _leftImageV;
}

- (UIImageView *)rightImageV{
    if (_rightImageV == nil) {
        _rightImageV = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImageV.image = [UIImage imageNamed:@"2_2"];
    }
    return _rightImageV;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:30];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.text = @"才发现爱可以如此美好";
    }
    return _titleLb;
}


@end
