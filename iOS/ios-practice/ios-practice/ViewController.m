//
//  ViewController.m
//  ios-practice
//
//  Created by Qing-Cheng Li on 2017/9/5.
//  Copyright © 2017年 Qing-Cheng Li. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self playWithBTN];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playWithBTN
{
    BinaryTreeNode *nodeA = [[BinaryTreeNode alloc] initWithValue:10];
    NSLog(@"%@", nodeA);

    BinaryTreeNode *nodeB = [nodeA copy];
    NSLog(@"%@", nodeB);
}

@end
