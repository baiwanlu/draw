//
//  ViewController.m
//  draw
//
//  Created by 道标朱 on 15/12/29.
//  Copyright © 2015年 道标朱. All rights reserved.
//

#import "ViewController.h"
#import "HYRecordView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *ARR = @[@12,@122,@13,@14,@15,@16,@17,@12,@122,@13,@14,@15,@16,@17,@13,@14,@15,@16,@17,@13,@14,@15,@16,@17];
    HYRecordView *hyR = [[HYRecordView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    hyR.viewType = HYRecordViewTypeMonth;
    hyR.dataArray = ARR;
    [self.view addSubview:hyR];
    
}


@end
