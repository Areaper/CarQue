//
//  CQNewsVCCell.m
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsVCCell.h"
#import "UIImageView+WebCache.h"
@implementation CQNewsVCCell



- (void)setModel:(CQNewArtlist *)Model
{
    _Model = Model;
    self.title.text   =  Model.title;
    self.comment.text =  Model.commentNums;
    

    //把时间戳转化为NSString
    double unixTimeStamp = Model.instime;
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"yyyy/MM/dd HH:MM:ss"];
    NSString *_date=[_formatter stringFromDate:date];
    
    //处理时间把时间格式改变为MM月dd日
    NSString *string = [_date substringWithRange:NSMakeRange(5,6)];
    NSString *string1 = [string stringByReplacingOccurrencesOfString:@"/" withString:@"月"];
    NSString *string2 = [string1 stringByAppendingString:@"日"];
    NSString *string3 =[string2 stringByReplacingCharactersInRange:NSMakeRange(3,1) withString:@""];
     NSString *string4 = [string3 stringByReplacingOccurrencesOfString:@" " withString:@""];;
    self.time.text    =  string4;
    
    //设置图片
    [self.coverImge sd_setImageWithURL:[NSURL URLWithString:Model.coverUrl]];
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
