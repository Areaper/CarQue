
//  DetailsForCarTableHeaderView.m
//  CarQue
//
//  Created by lanou on 16/3/5.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "DetailsForCarTableHeaderView.h"

@implementation DetailsForCarTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame titleLabText:(NSString *)text{
    if (self = [super initWithFrame:frame]) {
        self.titleLab = [[UILabel alloc]initWithFrame:frame];
        self.titleLab.backgroundColor = [UIColor blackColor];
        self.titleLab.textColor = [UIColor whiteColor];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.text = text;
        [self addSubview:self.titleLab];
    }
    return self;
}

@end
