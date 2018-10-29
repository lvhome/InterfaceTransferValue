//
//  ViewController.m
//  InterfaceTransferValue
//
//  Created by MAC on 2018/10/26.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController () <PushToContentDelegate>
{
    UILabel * changeLable;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * first = [UIButton buttonWithType:UIButtonTypeCustom];
    first.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 120, 200, 50);
    [first setTitle:@"正向传值" forState:UIControlStateNormal];
    [first addTarget:self action:@selector(toViewController:) forControlEvents:UIControlEventTouchUpInside];
    first.titleLabel.font = [UIFont systemFontOfSize:15];
    first.backgroundColor = [UIColor redColor];
    [self.view addSubview:first];
    
    UIButton * two = [UIButton buttonWithType:UIButtonTypeCustom];
    two.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 180, 200, 50);
    [two addTarget:self action:@selector(toViewController:) forControlEvents:UIControlEventTouchUpInside];
    [two setTitle:@"反向代理" forState:UIControlStateNormal];
    two.titleLabel.font = [UIFont systemFontOfSize:15];
    two.backgroundColor = [UIColor redColor];
    [self.view addSubview:two];
    
    UIButton * three = [UIButton buttonWithType:UIButtonTypeCustom];
    three.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 240, 200, 50);
    [three setTitle:@"反向block" forState:UIControlStateNormal];
    three.titleLabel.font = [UIFont systemFontOfSize:15];
    three.backgroundColor = [UIColor redColor];
    [self.view addSubview:three];
    [three addTarget:self action:@selector(toViewController:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * four = [UIButton buttonWithType:UIButtonTypeCustom];
    four.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 300, 200, 50);
    [four setTitle:@"反向通知" forState:UIControlStateNormal];
    four.titleLabel.font = [UIFont systemFontOfSize:15];
    four.backgroundColor = [UIColor redColor];
    [self.view addSubview:four];
    [four addTarget:self action:@selector(toViewController:) forControlEvents:UIControlEventTouchUpInside];
    changeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 380, [UIScreen mainScreen].bounds.size.width, 60)];
    changeLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:changeLable];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificeM:) name:@"PUSHTOCONTENT" object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)toViewController:(UIButton *)sender {
    FirstViewController * first = [[FirstViewController alloc] init];
    first.stringData = @"正向传的值";
    first.delegate = self;
    [self.navigationController pushViewController:first animated:YES];
    
    //    first.myBlock = ^(NSString * string) {
    //        changeLable.text = string;
    //    };
}

- (void)notificeM : (NSNotification *)nof {
    NSDictionary * dict = nof.userInfo;
    changeLable.text = [NSString stringWithFormat:@"%@",dict[@"content"]];
}

- (void)pushToConttent:(id)content {
    changeLable.text = [NSString stringWithFormat:@"%@",content];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
