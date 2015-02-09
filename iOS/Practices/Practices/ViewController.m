//
//  ViewController.m
//  Practices
//
//  Created by Qing-Cheng Li on 2015/2/7.
//  Copyright (c) 2015年 Qing-Cheng Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary* examples;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - self define functions
- (void)setupView
{
    //examples
    self.examples = @{@"2D":@[@"example 1",
                              @"example 2"
                              ],
                      @"3D":@[@"example 1",
                              @"example 2"
                              ]
                      };
    
    self.title = @"玩沙沙";
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return [self.examples[@"2D"] count];
    } else {
        return [self.examples[@"3D"] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"2D";
    }else{
        return @"3D";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.examples[@"2D"][indexPath.row];
    } else {
        cell.textLabel.text = self.examples[@"3D"][indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
    } else {
    }
}

@end
