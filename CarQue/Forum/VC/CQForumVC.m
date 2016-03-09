//
//  CQForumVC.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQForumVC.h"
#import "CQHotlist.h"
#import "CQHotListCell.h"
#import "CQHotDetailVC.h"
#import "MJRefresh.h"
#import "CalculateHeight.h"

#import "CQTabBarController.h"


@interface CQForumVC ()<UITableViewDataSource, UITableViewDelegate>
// 热点 model 数组
@property (nonatomic, strong) NSMutableArray *hotListArr;
// 新帖 model 数组
@property (nonatomic, strong) NSMutableArray *newsListArr;
// tableView
@property (nonatomic, strong) UITableView *tableView;
// 标记 看是否是第一次
@property (nonatomic, assign) int flag;


@end

@implementation CQForumVC 

#pragma mark - life circle
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.delegate =
    (id)self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self pullDownToRefreshLatestNews];
    // 下拉加载更多数据
    [self pullUpToLoadMoreNews];
    
    
    // json 解析数据, 并且放入数据数组
    [self dealTheData];
    // 安装 tableview
    [self setUpTableView];
    // 下拉加载最新数据
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate method
// tableViewDeletaMethod
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.hotListArr.count;
    }
    else
    {
        return self.newsListArr.count;
    }
    return 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotReuse"];
    CQHotlist *hotModel;
    if (indexPath.section == 0) {
        hotModel = self.hotListArr[indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        hotModel = self.newsListArr[indexPath.row];
    }
    cell.hotModel = hotModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotlist *model = [CQHotlist new];
    if (indexPath.section == 0) {
        model = self.hotListArr[indexPath.row];
    }
    else {
        model = self.newsListArr[indexPath.row];
    }
    
    CGFloat labelHeight = [CalculateHeight heightWithString:model.title lableWidth:SCREEN_WIDTH - 24 font:14];
    
    CGFloat substract = labelHeight - 45;
    
    
    return 120 + substract;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_hot_topic_pre@3x"]];
        imageView.frame = CGRectMake(0, 0, 20, 20);
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 100, 20)];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @"热门话题";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithRed:232/255.0 green:76/255.0 blue:90/255.0 alpha:1];
        [view addSubview:label];
        return view;
    }
    else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_fresh_topic_nor@3x"]];
        imageView.frame = CGRectMake(0, 0, 20, 20);
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 100, 20)];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @"最新问题";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithRed:89 / 255.0 green:142 / 255.0 blue:201 / 255.0 alpha:1];
        [view addSubview:label];
        return view;
    }
    
    
    return nil;
    
}
// cell 出现的动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 设置3D 映射动画
    CATransform3D transform3D = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 1.0);
    
    // 定义 cell 的初始化状态
    cell.alpha = 0.0;
    cell.layer.transform = transform3D;
    cell.layer.anchorPoint = CGPointMake(0.0, 0.5);
    
    // 定义 cell 的最终状态, 执行动画效果
    // 代码块设置动画
    [UIView animateWithDuration:0.5 animations:^{
        cell.alpha = 1.0;
        cell.layer.transform = CATransform3DIdentity;
        CGRect rect = cell.frame;
        rect.origin.x = 0.0;
        cell.frame = rect;
    }];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - private method
// 处理数据
- (void)dealTheData
{
    NSURL *url = [NSURL URLWithString:KCQForumAPI]; // 根据 API 获取 url
    NSData *data = [NSData dataWithContentsOfURL:url];
    // json 解析, 获得字典
    NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // 获得 result 字典
    NSMutableDictionary *resultDic = mDic[@"result"];
    // newlist 对应的数组
    NSMutableArray *newlistArr = resultDic[@"newlist"];
    // 将数据放入数据库
    for (int i = 0; i < newlistArr.count; i++) {
        CQHotlist *newModel = [CQHotlist modelObjectWithDictionary:newlistArr[i]];
        [self.newsListArr addObject:newModel];
    }
    
    // hotlist 对应的数组
    NSMutableArray *mArr = resultDic[@"hotlist"];
    for (int i = 0; i < mArr.count; i++) {
        CQHotlist *hotModel = [CQHotlist modelObjectWithDictionary:mArr[i]];
        [self.hotListArr addObject:hotModel];
    }
    
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
}

- (void)pullUpToLoadMoreNews
{
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self dealTheData];
    }];
    
}

// 设置 tableview
- (void)setUpTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

}

// 下拉刷新
- (void)pullDownToRefreshLatestNews
{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dealTheData)];
    // 进入刷新状态
    [self.tableView.header beginRefreshing];
}


#pragma mark - event response
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotDetailVC *detailVC = [[CQHotDetailVC alloc] init];
    NSString *qIdStr;
    if (indexPath.section == 0) {
        CQHotlist *model = self.hotListArr[indexPath.row];
        qIdStr = model.qId;
    }
    else {
        CQHotlist *model = self.newsListArr[indexPath.row];
        qIdStr = model.qId;
    }
    detailVC.qId = qIdStr;
    

    
    [self.navigationController pushViewController:detailVC animated:YES];
    NSLog(@"%@", detailVC.qId);
    
}

#pragma mark - setter and getter
// lazy load
- (NSMutableArray *)newsListArr
{
    if (_newsListArr == nil) {
        _newsListArr = [NSMutableArray array];
    }
    return _newsListArr;
}
- (NSMutableArray *)hotListArr
{
    if (_hotListArr == nil) {
        _hotListArr = [NSMutableArray array];
    }
    return _hotListArr;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        // 高度减去 tabbar 的高度
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 75) style:UITableViewStyleGrouped];
        [_tableView registerNib:[UINib nibWithNibName:@"CQHotListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HotReuse"];
    }
    return _tableView;
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
