//
//  CQNewsVC.h
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^NewsBlock)(NSString *);
typedef void(^NewsLoopBlock)(NSString *);
@interface CQNewsVC : UIViewController

//主要页面跳转
@property (copy, nonatomic) NewsBlock newsBlock;

//图片页面跳转

@property (copy, nonatomic) NewsLoopBlock newLoopBlock;



@end
