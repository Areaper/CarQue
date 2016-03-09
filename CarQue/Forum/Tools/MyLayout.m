//
//  MyLayout.m
//  UI_lesson21_UICollectionView
//
//  Created by lanou on 1/13/16.
//  Copyright © 2016 Corporal. All rights reserved.
//

#import "MyLayout.h"

@interface MyLayout ()

// 记录所有列的高度
@property (nonatomic, strong) NSMutableArray *heightOfLists;

// 保存计算出来的每个item的布局信息
@property (nonatomic, strong) NSMutableArray *layoutAttributesArr;

@end

@implementation MyLayout
- (NSMutableArray *)layoutAttributesArr
{
    if (_layoutAttributesArr == nil) {
        self.layoutAttributesArr = [NSMutableArray array];
    }
    return _layoutAttributesArr;
}

// 懒加载
- (NSMutableArray *)heightOfLists
{
    if (_heightOfLists == nil) {
        self.heightOfLists = [NSMutableArray array];
    }
    return _heightOfLists;
}

// 找到列高度的数组中最短的那一列的索引
- (NSInteger)indexofShortestList
{
    // 最短列的索引
    NSInteger index = 0;
    for (int i = 0; i < self.numberOfList; i++) {
        index = [self.heightOfLists[index] floatValue] > [self.heightOfLists[i] floatValue] ? i : index;
    }
    return index;
}



// 准备布局, 在此方法中计算每个item的位置和大小
- (void)prepareLayout
{
    [super prepareLayout];
    
    // 给每个列的高度赋初值
    for (int i = 0; i < self.numberOfList; i++) {
        
        [self.heightOfLists addObject:@(self.sectionInsects.top)];
        
        
        
    }
    
    // 获取item的个数
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    // 在循环中计算每个item的位置以及大小
    for (int i = 0; i < numberOfItems; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 计算 Y  先找到最短列的高度, 再加上行间距
        
        // 获取最短列的索引
        NSInteger indexOfShortestList = [self indexofShortestList];
        
        CGFloat Y = [self.heightOfLists[indexOfShortestList] floatValue] + self.itemSpacing;
        
        CGFloat X = self.sectionInsects.left + (self.itemSize.width + self.itemSpacing) * indexOfShortestList;
        
        // 计算每个item的高度
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(layout:heightForItemAtIndexPath:)]) {
            CGFloat itemHeight = [self.delegate layout:self heightForItemAtIndexPath:indexPath];
            
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            attributes.frame = CGRectMake(X, Y, self.itemSize.width, itemHeight);
            
            [self.layoutAttributesArr addObject:attributes];
            
            // 更新当前列的高度
            self.heightOfLists[indexOfShortestList] = @(Y + itemHeight);
            
        }
        
    }
    
}

// 返回计算好的布局信息
//- (NSArray *)layoutAttributesArrAtIndexes:(NSIndexSet *)indexes
//{
//    return self.layoutAttributesArr;
//}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.layoutAttributesArr;
}

// 获取最长列的长度
- (CGFloat)longestOfLongestList
{
    CGFloat height = 0;
    for (int i = 0; i < self.numberOfList; i++) {
        height = height < [self.heightOfLists[i] floatValue] ? [self.heightOfLists[i] floatValue] : height;
    }
    return height;
    
}

// collectionView的滚动范围
- (CGSize)collectionViewContentSize
{
    CGSize contentSize = CGSizeMake(0, [self longestOfLongestList] + self.sectionInsects.bottom);
    return contentSize;
}

@end
