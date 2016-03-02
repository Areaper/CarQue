//
//  CQFindCarLogoListTableViewCell.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQFindCarLogoListModel.h"

@interface CQFindCarLogoListTableViewCell : UITableViewCell

@property (nonatomic,strong)CQFindCarLogoListModel *findCarLogoListModel;

@property (weak, nonatomic) IBOutlet UIImageView *LogoImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;


@end
