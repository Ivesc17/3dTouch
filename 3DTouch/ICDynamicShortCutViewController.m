//
//  ICDynamicShortCutViewController.m
//  3DTouch
//
//  Created by IvesChan on 2016/9/22.
//  Copyright © 2016年 IvesChan. All rights reserved.
//

#import "ICDynamicShortCutViewController.h"

@interface ICDynamicShortCutViewController ()
{
    UITextField *content;
    NSInteger _count;
}

@end

@implementation ICDynamicShortCutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 90, 20)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:13.0f];
    title.text = @"设置标签名：";
    [self.view addSubview:title];
    
    content = [[UITextField alloc] initWithFrame:CGRectMake(110, 95, 180, 30)];
    content.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.7];
    content.textColor = [UIColor whiteColor];
    content.font = [UIFont systemFontOfSize:13.0f];
    [self.view addSubview:content];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 120, 30)];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.backgroundColor = [UIColor greenColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(newShortCut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)newShortCut
{
    NSString *title = content.text;
    if (title.length == 0) {
        NSLog(@"you need to set title first!");
        return;
    }
    // 标签个数上限为4，如果静态有4个，则动态部分显示不出来
    _count ++;
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"desktop_view_update"];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:[NSString stringWithFormat:@"custom-test-%ld",_count] localizedTitle:title localizedSubtitle:nil icon:icon userInfo:nil];
    // 添加还是替换根据需求
    NSMutableArray *allItems = [NSMutableArray arrayWithArray:[UIApplication sharedApplication].shortcutItems];
    [allItems insertObject:item atIndex:0];
    
    [UIApplication sharedApplication].shortcutItems = allItems;
    NSLog(@"set new item:%@",item);
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
