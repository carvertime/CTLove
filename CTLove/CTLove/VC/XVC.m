//
//  XVC.m
//  CTLove
//
//  Created by wenjie on 2017/8/23.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "XVC.h"

@interface XVC ()

@end

@implementation XVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nextBtn setTitle:@"home" forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)push{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
