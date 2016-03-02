//
//  CQHotListCell.h
//  CarQue
//
//  Created by leon on 16/3/1.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQHotlist.h"
#import "CQNewlist.h"

@interface CQHotListCell : UITableViewCell
@property (nonatomic, strong) CQHotlist *hotModel;
//@property (nonatomic, strong) CQNewlist *newsModel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *whetherAnswerImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *preferNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;


@end
