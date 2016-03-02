//
//  CQFindCarLogoListTableViewCell.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQFindCarLogoListTableViewCell.h"
#import "DownLoad.h"


@implementation CQFindCarLogoListTableViewCell

- (void)setFindCarLogoListModel:(CQFindCarLogoListModel *)findCarLogoListModel{
    _findCarLogoListModel = findCarLogoListModel;
    
    [DownLoad downLoadWithImageUrl:findCarLogoListModel.img resultBlock:^(NSData *data) {
        self.LogoImageV.image = [UIImage imageWithData:data];
    }];
    self.nameLab.text = [findCarLogoListModel.name stringByRemovingPercentEncoding];
}



@end
