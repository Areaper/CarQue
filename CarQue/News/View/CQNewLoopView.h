//
//  CQNewLoopView.h
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^addTapEventForImageViewWithBlock)(NSString *);


@interface CQNewLoopView : UIView


//数据
@property(nonatomic,retain)NSArray *array;

@property (nonatomic, copy) addTapEventForImageViewWithBlock block;

- (void)addTapEventForImageViewWithBlock:(addTapEventForImageViewWithBlock)block;



@end
