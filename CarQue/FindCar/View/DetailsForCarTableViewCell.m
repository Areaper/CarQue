//
//  DetailsForCarTableViewCell.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "DetailsForCarTableViewCell.h"

@implementation DetailsForCarTableViewCell

- (void)setModel:(DetailsForCarModel *)model{
    _model = model;
    self.itemNameLab.text = model.name;
    self.detailLab.text = model.value;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
