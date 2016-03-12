//
//  CQHotDetailVC.m
//  CarQue
//
//  Created by leon on 16/3/2.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQHotDetailVC.h"
#import "Result.h"
#import "Author.h"
#import "CQForumCommentCell.h"

#import "CQTabBarController.h"

@interface CQHotDetailVC ()<UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *authorArr;
@end

@implementation CQHotDetailVC

#pragma mark - life circle

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.hidesBottomBarWhenPushed = YES;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back@3x"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction:)];
        [self.navigationItem.leftBarButtonItem setTintColor:[UIColor redColor]];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载 tableview
    [self setUpTableview];
    
    // 加载 webView
    [self initWebView];
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.tableview.tableHeaderView = self.webView;
}
- (void)dealTheData
{
    self.urlStr = [kCQForumDetailAPI stringByReplacingOccurrencesOfString:@"****" withString:self.qId];
    NSLog(@"%@", self.urlStr);
    
    self.dataArr = [NSMutableArray array];
    NSString *commentAPIStr = [kCQForumCommentAPI stringByReplacingOccurrencesOfString:@"****" withString:self.qId];
    
    NSURL *url = [NSURL URLWithString:commentAPIStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    self.authorArr = [NSMutableArray array];
 
    NSDictionary *firstDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *firstArr = firstDic[@"result"];
    for (NSDictionary *dic in firstArr) {
        Result *model = [[Result alloc] initWithDictionary:dic];
        Author *author = model.author;
        [self.authorArr addObject:author];
        [self.dataArr addObject:model];
    }
    NSLog(@"%@", self.dataArr);
}

- (void)backBtnAction:(UIBarButtonItem *)leftBarButton
{


    [self.navigationController popViewControllerAnimated:YES];
    

}

- (void)setUpTableview
{
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"CQForumCommentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"reuse"];
    [self.view addSubview:self.tableview];
    
}
#pragma mark - delegate method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQForumCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    Result *model = self.dataArr[indexPath.row];
    cell.model = model;
    cell.author = self.authorArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark - setter and getter
- (UIWebView *)webView
{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
