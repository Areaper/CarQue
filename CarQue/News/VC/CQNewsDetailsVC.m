//
//  CQNewsDetailsVC.m
//  CarQue
//
//  Created by HJW-MAC on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsDetailsVC.h"

@interface CQNewsDetailsVC ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSString *urlStr;


@end

@implementation CQNewsDetailsVC


- (UIWebView *)webView
{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
    
    self.tabBarController.tabBar.hidden = YES;

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 加载 webView
    [self initWebView];
    
    

    
    
}

#pragma mark - private method
- (void)initWebView
{
    // 设置 webview 的代理人
    self.webView.delegate = self;
    // 处理数据
    [self dealTheData];
    NSURL *url = [NSURL URLWithString:self.urlStr];
    // 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 加载请求
    [self.webView loadRequest:request];
    // 添加 webview
    [self.view addSubview:self.webView];
    
  
    
}
- (void)dealTheData
{
  self.urlStr = [KCQRealNewsDetailsAPI stringByReplacingOccurrencesOfString:@"***" withString:self.NId];
   
 
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
      [webView stringByEvaluatingJavaScriptFromString:@"javascript:document.getElementById('bottom','tb-beacon-aplus').style.display='none';"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
