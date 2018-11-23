//
//  YAViewController.m
//  YABasicUIKit
//
//  Created by OneAlon on 12/04/2017.
//  Copyright (c) 2017 OneAlon. All rights reserved.
//

#import "YAViewController.h"
#import "YACellItem.h"
#import "YAGestureRecognizerVC.h"

#define cell_identifier @"YAViewControllerTableView"


@interface YAViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_itemArray;
}
@end

@implementation YAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell_identifier];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    _itemArray = [NSMutableArray array];
    [_itemArray addObject:[[YACellItem alloc]initWithTitle:@"UIView+YAGestureRecognizer" vcClass:[YAGestureRecognizerVC class]]];
    
    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    label.font = [UIFont ]

}


#pragma mark - tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_identifier];
    YACellItem *item = [_itemArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YACellItem *item = [_itemArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:[item.vcClass new] animated:YES];
}



@end
