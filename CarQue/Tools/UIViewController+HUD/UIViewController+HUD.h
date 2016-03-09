//
//  UIViewController+HUD.h
//  MusicPaly_1
//
//  Created by HJW-MAC on 16/1/22.
//  Copyright © 2016年 HJW-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)


- (void)sayH;

//显示菊花
- (void)showHUDwith:(NSString *)str;


//隐藏菊花
- (void)hideHUD;

//只显示文字的提示
- (void)showHUDAndHidewith:(NSString *)str;


@end
