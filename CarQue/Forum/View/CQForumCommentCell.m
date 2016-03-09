//
//  CQForumCommentCell.m
//  CarQue
//
//  Created by leon on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQForumCommentCell.h"

@interface CQForumCommentCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *userProfile;
@property (weak, nonatomic) IBOutlet UILabel *preferNumber;

@end

@implementation CQForumCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(Result *)model
{
    self.content.text = model.content;
    self.preferNumber.text = model.zanNums;
    self.time.text = model.instime;
    // 处理时间
    NSString *timeStr = model.instime;
    NSTimeInterval time = [timeStr doubleValue] + 28800;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MM-dd hh:mm"];
    NSString *currentTime = [dateFormatter stringFromDate:detailDate];
    self.time.text = currentTime;
    
    
}
- (void)setAuthor:(Author *)author
{
    self.userName.text = author.nickname;
    NSURL *userIcon = [NSURL URLWithString:author.memberIcon];
    [self.userProfile sd_setImageWithURL:userIcon];
    
    
}

@end
