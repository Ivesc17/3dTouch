//
//  ViewController.m
//  3DTouch
//
//  Created by IvesChan on 2016/9/22.
//  Copyright © 2016年 IvesChan. All rights reserved.
//

#import "ViewController.h"
#import "ICDynamicShortCutViewController.h"
#import "ICListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 30)];
    [button setTitle:@"设置动态标签" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(setNewShortCut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(100, 160, 120, 30)];
    [button setTitle:@"测试Peek and Pop" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(testPeekAndPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)setNewShortCut
{
    ICDynamicShortCutViewController *vctl = [[ICDynamicShortCutViewController alloc] init];
    [self.navigationController pushViewController:vctl animated:YES];
}

- (void)testPeekAndPop
{
    ICListViewController *vctl = [[ICListViewController alloc] init];
    [self.navigationController pushViewController:vctl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
