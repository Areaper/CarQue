//
//  CQHotListCell.m
//  CarQue
//
//  Created by leon on 16/3/1.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQHotListCell.h"

@implementation CQHotListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setHotModel:(CQHotlist *)hotModel
{
    _userName.text = hotModel.memberName;
    _contentLabel.text = hotModel.title;
    
}


@end
