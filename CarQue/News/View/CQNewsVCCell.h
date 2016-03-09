//
//  CQNewsVCCell.h
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQNewArtlist.h"

@interface CQNewsVCCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *coverImge;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *comment;

@property (nonatomic, strong) CQNewArtlist *Model;




@end
