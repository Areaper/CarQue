//
//  OneBrandListTableVC.h
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^getBlock)(NSString * ,NSString *);

@interface OneBrandListTableVC : UITableViewController

@property (nonatomic,copy)getBlock getblock;
                        
@end
