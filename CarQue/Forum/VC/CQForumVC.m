//
//  CQForumVC.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQForumVC.h"
#import "CQHotlist.h"
#import "CQNewlist.h"

@interface CQForumVC ()
// 热点 model 数组
@property (nonatomic, strong) NSMutableArray *hotListArr;
// 新帖 model 数组
@property (nonatomic, strong) NSMutableArray *newsListArr;
// tableView
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CQForumVC

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // json 解析数据, 并且放入数据数组
    [self dealTheData];
    // 安装 tableview
    [self setUpTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate method

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
        CQNewlist *newModel = [CQNewlist modelObjectWithDictionary:newlistArr[i]];
        [self.newsListArr addObject:newModel];
    }
    
    // hotlist 对应的数组
    NSMutableArray *mArr = resultDic[@"hotlist"];
    for (int i = 0; i < mArr.count; i++) {
        CQHotlist *hotModel = [CQHotlist modelObjectWithDictionary:mArr[i]];
        [self.hotListArr addObject:hotModel];
    }
    
}

// 设置 tableview
- (void)setUpTableView
{
    
    
}

#pragma mark - event response

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
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
