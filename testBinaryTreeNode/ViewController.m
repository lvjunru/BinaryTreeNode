//
//  ViewController.m
//  testBinaryTreeNode
//
//  Created by 测试 on 2019/8/12.
//  Copyright © 2019 lv. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
    
}


- (void)setUp
{
    NSArray *arr = [NSArray arrayWithObjects:@(7),@(6),@(3),@(2),@(1),@(9),@(10),@(12),@(14),@(4),@(14), nil];
    BinaryTreeNode *tree = [BinaryTreeNode new];
    tree = [BinaryTreeNode createTreeWithValues:arr];
    
    //最大节点
    BinaryTreeNode *maxroot = [BinaryTreeNode MaxBinaryTree:tree];
    NSLog(@"最大节点 %zd",maxroot.value);
    
    // 3 节点
    BinaryTreeNode *tree1 = [BinaryTreeNode treeNodeAtIndex:3 inTree:tree];
    NSLog(@"第 3 节点 %zd",tree1.value);
    
    NSMutableArray *orderArray = [NSMutableArray array];
    [BinaryTreeNode preOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray addObject:@(treeNode.value)];
    }];
    NSLog(@"先序遍历结果：%@", [orderArray componentsJoinedByString:@","]);
    
    NSMutableArray *orderArray1 = [NSMutableArray array];
    [BinaryTreeNode inOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        
        [orderArray1 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"中序遍历结果：%@", [orderArray1 componentsJoinedByString:@","]);
    
    
    NSMutableArray *orderArray2 = [NSMutableArray array];
    [BinaryTreeNode postOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray2 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"后序遍历结果：%@", [orderArray2 componentsJoinedByString:@","]);
    
    
    NSMutableArray *orderArray3 = [NSMutableArray array];
    [BinaryTreeNode levelTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray3 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"层次遍历结果：%@", [orderArray3 componentsJoinedByString:@","]);
    
    NSLog(@"二叉树的深度：%zd", [BinaryTreeNode depthOfTree:tree]);
    
    NSLog(@"二叉树的所有节点数：%zd", [BinaryTreeNode numberOfNodesInTree:tree]);
    
    NSLog(@"二叉树 %d 层中的节点数：%zd",2,[BinaryTreeNode numberOfNodesOnLevel:2 inTree:tree]);
    
    NSLog(@"二叉树叶子节点数：%zd",[BinaryTreeNode numberOfLeafsInTree:tree]);
    
    NSLog(@"二叉树最大距离：%zd",[BinaryTreeNode maxDistanceOfTree:tree]);
    
    NSLog(@"二叉树的宽度：%zd", [BinaryTreeNode widthOfTree:tree]);
    
    TreeNodeProperty * p = [BinaryTreeNode propertyOfTreeNode:tree];
    NSLog(@"二叉树最大距离：%zd 深度:%zd",p.distance,p.depth);
    
    NSLog(@"二叉树中两个节点之间的距离：%zd", [BinaryTreeNode distanceFromNode:maxroot toNode:tree1 inTree:tree]);
    
    NSLog(@" %@ 完全二叉树", [BinaryTreeNode isCompleteBinaryTree:tree] ? @"是" : @"不是");
    
    NSLog(@" %@ 满二叉树", [BinaryTreeNode isFullBinaryTree:tree] ? @"是" : @"不是");
    
    NSLog(@" %@ 平衡二叉树", [BinaryTreeNode isAVLBinaryTree:tree] ? @"是" : @"不是");
    // 翻转树
    BinaryTreeNode *invertroot = [BinaryTreeNode invertBinaryTree:tree];
    NSMutableArray *inverArray = [NSMutableArray array];
    [BinaryTreeNode inOrderTraverseTree:invertroot handler:^(BinaryTreeNode *treeNode) {
        [inverArray addObject:@(treeNode.value)];
    }];
    NSLog(@"遍历结果：%@", [inverArray componentsJoinedByString:@","]);
    
}
@end
