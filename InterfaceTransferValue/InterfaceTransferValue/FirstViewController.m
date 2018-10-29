//
//  FirstViewController.m
//  InterfaceTransferValue
//
//  Created by MAC on 2018/10/29.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * three = [UIButton buttonWithType:UIButtonTypeCustom];
    three.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 240, 200, 50);
    [three setTitle:@"反向block" forState:UIControlStateNormal];
    three.titleLabel.font = [UIFont systemFontOfSize:15];
    three.backgroundColor = [UIColor redColor];
    [self.view addSubview:three];
    three.tag = 2;
    [three addTarget:self action:@selector(pushToFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * two = [UIButton buttonWithType:UIButtonTypeCustom];
    two.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 180, 200, 50);
    [two addTarget:self action:@selector(pushToFirst:) forControlEvents:UIControlEventTouchUpInside];
    [two setTitle:@"反向代理" forState:UIControlStateNormal];
    two.titleLabel.font = [UIFont systemFontOfSize:15];
    two.tag = 1;

    two.backgroundColor = [UIColor redColor];
    [self.view addSubview:two];
    
    
    UIButton * four = [UIButton buttonWithType:UIButtonTypeCustom];
    four.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 300, 200, 50);
    four.tag = 3;
    [four setTitle:@"反向通知" forState:UIControlStateNormal];
    four.titleLabel.font = [UIFont systemFontOfSize:15];
    four.backgroundColor = [UIColor redColor];
    [self.view addSubview:four];
    [four addTarget:self action:@selector(pushToFirst:) forControlEvents:UIControlEventTouchUpInside];
    //打印正向通过属性传的值
    NSLog(@"正向传值------%@",self.stringData);
    // Do any additional setup after loading the view.
}


- (void)pushToFirst:(UIButton *)sender {
    if (sender.tag == 1) {
       
       // 通过代理传值首次判断代理是否存在，并在代理能够响应代理方法时才执行代理方法
        if (self.delegate && [self.delegate respondsToSelector:@selector(pushToConttent:)]) {
            [self.delegate pushToConttent:@"代理传的值"];
        }
    } else if (sender.tag == 2){
        self.myBlock(@"block传的值");
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PUSHTOCONTENT" object:self userInfo:@{@"content":@"通知传值"}];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
