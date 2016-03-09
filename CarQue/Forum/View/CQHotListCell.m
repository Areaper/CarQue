//
//  CQHotListCell.m
//  CarQue
//
//  Created by leon on 16/3/1.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQHotListCell.h"
#import "UIImageView+WebCache.h"

@implementation CQHotListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setHotModel:(CQHotlist *)hotModel
{
    // 用户名
    _userName.text = hotModel.memberName;
    // 内容
    _contentLabel.text = hotModel.title;
    // 头像 使用了 SDWebImage
    NSURL *userImageUrl = [NSURL URLWithString:hotModel.memberImg];
    [_userImage sd_setImageWithURL:userImageUrl];
    // 是否已答
    int whetherAnswerInt = [hotModel.status intValue];
    if (whetherAnswerInt == 3) {
        _whetherAnswerImage.image = [UIImage imageNamed:@"ico_comment_hot@3x"];
    }
    else
    {
        _whetherAnswerImage.image = [UIImage imageNamed:@"ico_comment_new@3x"];
    }
    // 日期
    // 转化
    NSString *timeStr = [NSString stringWithFormat:@"%f", hotModel.insTime];
    NSTimeInterval time = [timeStr doubleValue] + 28800;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MM-dd hh:mm"];
    NSString *currentTime = [dateFormatter stringFromDate:detailDate];
    _timeLabel.text = currentTime;
    
    // 点赞数
    NSInteger imgCount = hotModel.imgsCount;
    NSString *imageCountStr = [NSString stringWithFormat:@"%ld", imgCount];
    _preferNumberLabel.text = imageCountStr;
    // 评论数
    _commentNumberLabel.text = hotModel.commentNums;
    
    
}


@end
