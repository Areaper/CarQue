//
//  CustomCollectionCell.m
//  CarQue
//
//  Created by leon on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CustomCollectionCell.h"

@interface CustomCollectionCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation CustomCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(CQResult *)model
{
    _titleLabel.text = model.name;
    _numberLabel.text = [NSString stringWithFormat:@"%@", model.qNums];
    _numberLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _numberLabel.layer.cornerRadius = 10;
    _numberLabel.layer.borderWidth = 0.5;
}

@end
