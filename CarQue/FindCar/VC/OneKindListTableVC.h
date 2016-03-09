//
//  OneKindListTableVC.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneKindListTableVC : UITableViewController

//  车系接口ID
@property (nonatomic,copy)NSString *pseridID;
@property (nonatomic,copy)NSString *priceStr;
//  标题
@property (nonatomic,strong)NSString *topTitleStr;


@end
