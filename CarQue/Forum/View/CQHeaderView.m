//
//  CQHeaderView.m
//  CarQue
//
//  Created by leon on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQHeaderView.h"
#define kHeight frame.size.height
#define kNameLX SCREEN_WIDTH / 7 * 4
@interface CQHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation CQHeaderView


- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color name:(NSString *)name number:(NSString *)number
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = color;
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, SCREEN_WIDTH / 9 * 4, frame.size.height)];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.text = name;
        self.nameLabel.clipsToBounds = YES;
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        
        self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(kNameLX, 6, kNameLX - 88, kHeight - 12)];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        self.numberLabel.text = number;
        self.numberLabel.font = [UIFont systemFontOfSize:12];
        self.numberLabel.layer.cornerRadius = 7;
        self.numberLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.numberLabel.layer.borderWidth = 1;
        
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.numberLabel];
        
    }
    return self;
}

@end
