//
//  OneBrandListTableViewCell.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneBrandListModel.h"

@interface OneBrandListTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

@property (nonatomic,strong)OneBrandListModel *model;


@end
