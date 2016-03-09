//
//  CalculateHeight.m
//  tableViewCell自定义高度
//
//  Created by lanou on 12/29/15.
//  Copyright © 2015 Areaper. All rights reserved.
//

#import "CalculateHeight.h"

@implementation CalculateHeight

+ (CGFloat)heightWithString:(NSString *)string lableWidth:(CGFloat)labelWidth font:(CGFloat)font
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(labelWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    
    return rect.size.height;
    
}

@end
