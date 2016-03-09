//
//  DetailsForCarTableHeaderView.h
//  CarQue
//
//  Created by lanou on 16/3/5.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsForCarTableHeaderView : UITableViewHeaderFooterView

@property (strong, nonatomic) UILabel *titleLab;
- (instancetype)initWithFrame:(CGRect)frame titleLabText:(NSString *)text;

@end
