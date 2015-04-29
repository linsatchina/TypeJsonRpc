//
//  ViewController.m
//  test
//
//  Created by fc01 on 15/4/29.
//  Copyright (c) 2015年 zsbrother. All rights reserved.
//

#import "ViewController.h"
#import "WebAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WebAPI products_list:self cate:@"" page:@"" pagesize:@"" sort:@"" onSuceess:^(Ret_products_list *ret) {
        NSLog(@"ret.r_BrandData[0].r_BName=%@",ret.r_BrandData[0].r_BName);
    } onFailed:^(enum WebAPIErrorCode errorCode, NSString *msg) {
        NSLog(@"errorCode=%ld msg=%@",errorCode,msg);
    }];
}

@end
