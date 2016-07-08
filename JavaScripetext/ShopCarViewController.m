//
//  ShopCarViewController.m
//  JavaScripetext
//
//  Created by Rongheng on 16/4/23.
//  Copyright © 2016年 Rongheng. All rights reserved.
//

#import "ShopCarViewController.h"
#import "shopCarTableViewCell.h"

@interface ShopCarViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ShopCarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.shopCarTableView];
    [self initshopCarTableView];
    [self.view addSubview:self.numberLable];
}
- (void)initshopCarTableView
{
//    if (!self.shopCarTableView) {
//        self.shopCarTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
//    }
    self.shopCarTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.shopCarTableView.delegate = self;
    self.shopCarTableView.dataSource = self;
    _shopCarTableView.rowHeight = 69;
    _shopCarTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _shopCarTableView.allowsSelection = NO;(不接收点击事件)
    [self.view addSubview:_shopCarTableView];
//    return self.shopCarTableView;
}

- (UILabel *)numberLable
{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    }
    _numberLable.backgroundColor = [UIColor lightGrayColor];
    _numberLable.textColor = [UIColor blackColor];
    return _numberLable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    shopCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[shopCarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    [cell disPlayCellWithMessage:indexPath.row];
//    [cell setSubtractClickBlock:^{
//        NSLog(@"");
//    }];
    
    [cell setAddClickBlock:^(NSInteger i, NSString *str, int box) {
        NSLog(@"点击了滴%d行，%@,zongshu=%d",i,str,box);
        _numberLable.text = [NSString stringWithFormat:@"总数是：%d",box];
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *selelist = [_shopCarTableView indexPathsForVisibleRows];
    NSLog(@"%@",selelist);
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
