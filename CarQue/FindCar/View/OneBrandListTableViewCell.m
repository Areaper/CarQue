
//
//  OneBrandListTableViewCell.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "OneBrandListTableViewCell.h"
#import "OneBrandListModel.h"

@implementation OneBrandListTableViewCell

-(void)setModel:(OneBrandListModel *)model{
    _model = model;
    self.nameLab.text = model.name;
    self.priceLab.text = model.price;
}

@end
