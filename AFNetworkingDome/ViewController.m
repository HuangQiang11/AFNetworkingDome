//
//  ViewController.m
//  AFNetworkingDome
//
//  Created by ttlgz-0022 on 15/12/24.
//  Copyright © 2015年 Transaction Technologies Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor redColor]];
    button.frame = CGRectMake(10, 90, 100, 30);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundColor:[UIColor redColor]];
    button2.frame = CGRectMake(10, 200, 100, 30);
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonAction:(UIButton *)button{
    NSMutableDictionary *loginParams = [[NSMutableDictionary alloc] init];
    [loginParams setObject:@"123456" forKey:@"password"];
    [loginParams setObject:@"qiang1@163.com" forKey:@"username"];
    [loginParams setObject:@"user" forKey:@"app"];
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:loginParams aURL:@"" method:kPOST delegate:self];

}

- (void)buttonAction2:(UIButton *)button{
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:nil aURL:@"" method:kPOST delegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
