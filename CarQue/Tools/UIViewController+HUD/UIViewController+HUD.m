//
//  UIViewController+HUD.m
//  MusicPaly_1
//
//  Created by HJW-MAC on 16/1/22.
//  Copyright © 2016年 HJW-MAC. All rights reserved.
//




#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"




@implementation UIViewController (HUD)


- (void)showHUDwith:(NSString *)str
{

    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithFrame:self.view.bounds];
    
    // hud.mode = MBProgressHUDModeText;
    hud.labelText = str;
    hud.tag =1000;
    [hud show:YES];
    [self.view addSubview:hud];

    

}


- (void)hideHUD
{
    for (UIView *view in self.view.subviews) {
        if (view.tag == 1000) {
            [((MBProgressHUD *)view) hide:YES];
            
        }
    }



}


- (void)showHUDAndHidewith:(NSString *)str
{

    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithFrame:self.view.bounds];
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = str;
    
    [hud show:YES];
    [self.view addSubview:hud];
    
    [hud hide:YES afterDelay:2];





}



-(void)sayH
{
    NSLog(@"H");
    


}



@end
