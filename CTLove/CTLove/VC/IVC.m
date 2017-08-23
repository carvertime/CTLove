//
//  IVC.m
//  CTLove
//
//  Created by wenjie on 2017/8/21.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "IVC.h"
#import <Masonry/Masonry.h>
#import <PureLayout/PureLayout.h>

@interface IVC ()

@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation IVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startAnimation];
}

- (void)setupUI{
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.imageV];
    self.imageV.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 100, 200, 200);
}

- (void)startAnimation{
    [UIView animateWithDuration:5 animations:^{
        self.imageV.frame = CGRectMake(0, 100, 200, 200);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImageView *)imageV{
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageV.backgroundColor = [UIColor redColor];
    }
    return _imageV;
}


@end
