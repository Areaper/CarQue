//
//  DetailsForCarTableViewCell.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsForCarModel.h"

@interface DetailsForCarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemNameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;

@property (nonatomic,strong)DetailsForCarModel *model;

@end
