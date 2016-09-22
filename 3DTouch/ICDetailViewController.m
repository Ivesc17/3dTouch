//
//  ICDetailViewController.m
//  3DTouch
//
//  Created by IvesChan on 2016/9/22.
//  Copyright © 2016年 IvesChan. All rights reserved.
//

#import "ICDetailViewController.h"

@interface ICDetailViewController ()

@end

@implementation ICDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 90, 20)];
    title.backgroundColor = [UIColor orangeColor];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:13.0f];
    title.text = [NSString stringWithFormat:@"详情--%ld",self.index];
    [self.view addSubview:title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *p1 = [UIPreviewAction actionWithTitle:@"option1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"notice" message:@"you had selected option1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
    
    
    UIPreviewAction *p2 = [UIPreviewAction actionWithTitle:@"option2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"selected option2");
    }];
    
    
    UIPreviewAction *p3 = [UIPreviewAction actionWithTitle:@"option3" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"selected option3");
        
    }];
    
    return @[p1,p2,p3];
}

@end
