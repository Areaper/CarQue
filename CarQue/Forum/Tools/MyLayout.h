//
//  MyLayout.h
//  UI_lesson21_UICollectionView
//
//  Created by lanou on 1/13/16.
//  Copyright © 2016 Corporal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyLayout;

@protocol MyLayoutDelegate <NSObject>

// 当前类的对象传给代理人一个indexPath, 代理人给当前类的对象返回一个高度
- (CGFloat)layout:(MyLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyLayout : UICollectionViewLayout



// item大小, 只需要宽度
@property (nonatomic, assign) CGSize itemSize;

// 列数
@property (nonatomic, assign) NSInteger numberOfList;

// 行间距和列间距
@property (nonatomic, assign) CGFloat itemSpacing;

// 上左下右的间距
@property (nonatomic, assign) UIEdgeInsets sectionInsects;

@property (nonatomic, weak) id<MyLayoutDelegate> delegate;



@end
