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
    
    
    [WebAPI f1:self onSuceess:^(Ret_f1_Array *ret) {
        NSLog(@"ret=%@",ret);
    } onFailed:^(enum WebAPIErrorCode errorCode, NSString *msg) {
        NSLog(@"errorCode=%ld msg=%@",errorCode,msg);
    }];
}

@end
