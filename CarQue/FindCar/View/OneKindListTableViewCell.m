//
//  OneKindListTableViewCell.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "OneKindListTableViewCell.h"

@implementation OneKindListTableViewCell

- (void)setModel:(OneKindListModel *)model{
    _model = model;
    self.nameLab.text = model.name;
}

- (IBAction)compareCarAction:(UIButton *)sender {
    NSLog(@"比车");
}



@end
