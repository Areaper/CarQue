//
//  CQShoppingVC.m
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQShoppingVC.h"
#import "CQPictureResult.h"
#import "CQNewsVCCell.h"
#import "CQPictureViewCell.h"

@interface CQShoppingVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;


//设置图片model
@property (nonatomic, strong)NSMutableArray *pictureModelArr;



@end


@implementation CQShoppingVC


-(NSMutableArray *)pictureModelArr{
    if (!_pictureModelArr) {
        _pictureModelArr = [NSMutableArray array];
    }
    return _pictureModelArr;
}

#pragma mark 设置tableview
- (void)setPictureTabview
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CQPictureViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"shopping"];
    [self.view addSubview:self.tableView];
    
    
    
    
    
}
#pragma mark 处理picture数据
- (void)dealWithData
{
    NSURL *url = [NSURL URLWithString:KCQShoppingAPI]; // 根据 API 获取
    NSData *data = [NSData dataWithContentsOfURL:url];
    // json 解析, 获得字典
    NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // result 对应的数组
    NSMutableArray *piclistArr = mDic[@"result"];
    // 将数据放入数据库
    for (int i = 0; i < piclistArr.count; i++) {
        CQPictureResult *picModel = [CQPictureResult modelObjectWithDictionary:piclistArr[i]];
        
        [self.pictureModelArr addObject:picModel];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES];
//    [self setPictureTabview];
//    [self dealWithData];
//    
//    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _pictureModelArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQPictureViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopping" forIndexPath:indexPath];
    
    cell.Model = _pictureModelArr[indexPath.row];
    
    
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 89;
    
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
