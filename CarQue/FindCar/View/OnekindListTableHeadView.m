//
//  OnekindListTableHeadView.m
//  CarQue
//
//  Created by lanou on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "OnekindListTableHeadView.h"

@implementation OnekindListTableHeadView

- (instancetype)initWithFrame:(CGRect)frame titleLab:(NSString *)titleLabStr priceLab:(NSString *)priceLabStr{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height - 65;
        
        self.topImageBut = [UIButton buttonWithType:UIButtonTypeCustom];
        self.topImageBut.frame = CGRectMake(0, 0, width, height);
        [self.topImageBut setBackgroundImage:[UIImage imageNamed:@"load_carousel.png"] forState:UIControlStateNormal];
        [self.topImageBut addTarget:self action:@selector(pushPictureDetailVC:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.topImageBut];
        
        self.imageCountLab = [[UILabel alloc]initWithFrame:CGRectMake(width - 120, height - 40, 120, 30)];
        self.imageCountLab.backgroundColor = [UIColor clearColor];
        [self addSubview:self.imageCountLab];
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, height + 5, width, 30)];
        self.titleLab.backgroundColor = [UIColor clearColor];
        self.titleLab.text = titleLabStr;
        [self addSubview:self.titleLab];
        
        self.priceLab = [[UILabel alloc]initWithFrame:CGRectMake(10, height + 35, width, 25)];
        self.priceLab.backgroundColor = [UIColor clearColor];
        self.priceLab.text = [NSString stringWithFormat:@"厂家指导价:%@",priceLabStr];
        self.priceLab.font = [UIFont systemFontOfSize:15];
        self.priceLab.textColor = [UIColor redColor];
        [self addSubview:self.priceLab];

    }
    return self;
}


- (void)pushPictureDetailVC:(UIButton *)button {
    
}


@end
