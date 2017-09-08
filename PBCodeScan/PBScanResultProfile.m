//
//  PBScanResultProfile.m
//  PBCodeScan
//
//  Created by nanhujiaju on 2017/9/8.
//  Copyright © 2017年 nanhujiaju. All rights reserved.
//

#import "PBScanResultProfile.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>

@interface PBScanResultProfile ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation PBScanResultProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //init back navigation bar item
    //left
    UIBarButtonItem *spacer = [self barSpacer];
    UIBarButtonItem *backBarItem = [self backBarButtonItem:nil withIconUnicode:@"\U0000e6e2"];
    //[self.navigationBar pushNavigationItem:leftItem animated:true];
    UINavigationItem *title = [[UINavigationItem alloc] initWithTitle:@"扫码结果"];
    title.leftBarButtonItems = @[spacer, backBarItem];
    [self.navigationBar pushNavigationItem:title animated:true];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view insertSubview:self.label belowSubview:self.navigationBar];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.text = self.scanInfo;
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
