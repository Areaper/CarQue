//
//  CQHeaderView.h
//  CarQue
//
//  Created by leon on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQHeaderView : UIView
@property (nonatomic, strong) UIColor *color;


- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color name:(NSString *)name number:(NSString *)number;

@end
