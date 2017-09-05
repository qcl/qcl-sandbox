//
//  TreeNode.h
//  ios-practice
//
//  Created by Qing-Cheng Li on 2017/9/5.
//  Copyright © 2017年 Qing-Cheng Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) BinaryTreeNode *leftNode;
@property (nonatomic, strong) BinaryTreeNode *rightNode;

- (instancetype)initWithValue:(NSInteger)value;

@end
