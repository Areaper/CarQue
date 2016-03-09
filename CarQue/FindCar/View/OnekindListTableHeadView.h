//
//  OnekindListTableHeadView.h
//  CarQue
//
//  Created by lanou on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OnekindListTableHeadView : UIView

@property (strong, nonatomic) UIButton *topImageBut;
@property (strong, nonatomic) UILabel *imageCountLab;
@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UILabel *priceLab;

- (instancetype)initWithFrame:(CGRect)frame titleLab:(NSString *)titleLabStr priceLab:(NSString *)priceLabStr;

@end
