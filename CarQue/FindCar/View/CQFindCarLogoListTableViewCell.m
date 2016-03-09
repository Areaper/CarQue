//
//  CQFindCarLogoListTableViewCell.m
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQFindCarLogoListTableViewCell.h"

#import "UIImageView+WebCache.h"

@implementation CQFindCarLogoListTableViewCell

- (void)setFindCarLogoListModel:(CQFindCarLogoListModel *)findCarLogoListModel{
    _findCarLogoListModel = findCarLogoListModel;
    
    [self.LogoImageV sd_setImageWithURL:[NSURL URLWithString:findCarLogoListModel.img]];
    self.nameLab.text = [findCarLogoListModel.name stringByRemovingPercentEncoding];
}



@end