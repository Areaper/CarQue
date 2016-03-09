//
//  CQFindCarLogoListTableVC.h
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cellBlock)(NSString * ,NSString *);

@interface CQFindCarLogoListTableVC : UITableViewController

@property (nonatomic,copy)cellBlock cellblock;

@end
