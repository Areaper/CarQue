//
//  CalculateHeight.h
//  tableViewCell自定义高度
//
//  Created by lanou on 12/29/15.
//  Copyright © 2015 Areaper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CalculateHeight : NSObject
+ (CGFloat)heightWithString:(NSString *)string
                 lableWidth:(CGFloat)labelWidth
                       font:(CGFloat)font;

@end
