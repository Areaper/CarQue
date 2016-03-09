//
//  CQPictureVC.h
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PictureBlock)(NSInteger);

@interface CQPictureVC : UIViewController

@property (copy, nonatomic) PictureBlock pictureBlock;





@end
