//
//  ViewController.m
//  GCButtonDemo
//
//  Created by 高诚 on 2017/8/23.
//  Copyright © 2017年 高诚. All rights reserved.
//

#import "ViewController.h"
#import "GCButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GCButton *btn = [[GCButton alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"点我点我" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
