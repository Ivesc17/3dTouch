//
//  ICListViewController.m
//  3DTouch
//
//  Created by IvesChan on 2016/9/22.
//  Copyright © 2016年 IvesChan. All rights reserved.
//

#import "ICListViewController.h"
#import "ICDetailViewController.h"

@interface ICListViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>
{
    UITableView *_tableView;
}
@end

@implementation ICListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 101;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuse-identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell-%ld",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"peek and pop"];
    return cell;
}

#pragma mark - UIViewControllerPreviewingDelegate

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    CGPoint p = [_tableView convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:p];
    ICDetailViewController *vctl = [[ICDetailViewController alloc] init];
    vctl.index = indexPath.row;
    return vctl;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

@end
