//
//  CQForumCommentCell.h
//  CarQue
//
//  Created by leon on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Result.h"
#import "Author.h"

@interface CQForumCommentCell : UITableViewCell
@property (nonatomic, strong) Result *model;
@property (nonatomic, strong) Author *author;

@end
