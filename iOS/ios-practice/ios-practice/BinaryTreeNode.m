//
//  TreeNode.m
//  ios-practice
//
//  Created by Qing-Cheng Li on 2017/9/5.
//  Copyright © 2017年 Qing-Cheng Li. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

- (instancetype)initWithValue:(NSInteger)value
{
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    BinaryTreeNode *node = [[self class] allocWithZone:zone];
    node.value = self.value;
    return node;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"node: %ld", self.value];
}

@end
