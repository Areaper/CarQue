//
//  CQSortDetailTVC.h
//  CarQue
//
//  Created by leon on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQResult.h"


@interface CQSortDetailTVC : UITableViewController

// 详情页面的 model
@property (nonatomic, strong) NSString *cId;
@property (nonatomic, strong) CQResult *model;
@property (nonatomic, strong) UIColor *color;

@end
