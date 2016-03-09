//
//  OneKindListTableViewCell.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OneKindListModel.h"

@interface OneKindListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *compareCarBut;

@property (nonatomic,strong)OneKindListModel *model;
@end
