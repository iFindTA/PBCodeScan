//
//  ViewController.m
//  PBCodeScan
//
//  Created by nanhujiaju on 2017/9/8.
//  Copyright © 2017年 nanhujiaju. All rights reserved.
//

#import "ViewController.h"
#import "PBCodeScanProfile.h"
#import "PBScanResultProfile.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //init back navigation bar item
    //left
    //UIBarButtonItem *spacer = [self barSpacer];
    //UIBarButtonItem *backBarItem = [self backBarButtonItem:nil];
    UINavigationItem *title = [[UINavigationItem alloc] initWithTitle:@"扫码功能模块集成"];
    //title.leftBarButtonItems = @[spacer, backBarItem];
    [self.navigationBar pushNavigationItem:title animated:true];
    
    //CGRect bounds = CGRectMake(100, 100, 200, 50);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor pb_randomColor];
    [btn setTitle:@"Scan Code" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qrCodeScanEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    weakify(self)
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.top.equalTo(self.navigationBar.mas_bottom).offset(120);
        make.left.equalTo(self.view).offset(PB_BOUNDARY_MARGIN);
        make.right.equalTo(self.view).offset(-PB_BOUNDARY_MARGIN);
        make.height.equalTo(@(PB_CUSTOM_BTN_HEIGHT));
    }];
}

- (IBAction)xibScanEvent:(id)sender {
    weakify(self)
    PBCodeScanProfile *scanner = [[PBCodeScanProfile alloc] init];
    [scanner handleScanCodeWithCompletion:^(NSError * _Nullable code) {
        NSLog(@"scan result code:%@", code.domain);
        strongify(self)
        [self displayResult:code.domain];
    }];
    [self.navigationController pushViewController:scanner animated:true];
}

- (void)qrCodeScanEvent {
    weakify(self)
    PBCodeScanProfile *scanner = [[PBCodeScanProfile alloc] init];
    [scanner handleScanCodeWithCompletion:^(NSError * _Nullable code) {
        NSLog(@"scan result code:%@", code.domain);
        strongify(self)
        [self displayResult:code.domain];
    }];
    [self.navigationController pushViewController:scanner animated:true];
}

- (void)displayResult:(NSString *)info {
    PBScanResultProfile *resultProfile = [[PBScanResultProfile alloc] init];
    resultProfile.scanInfo = info;
    [self.navigationController pushViewController:resultProfile animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
