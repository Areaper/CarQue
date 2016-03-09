
//
//  CQFindCarLogoListTableVC.m
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQFindCarLogoListTableVC.h"
#import "DownLoad.h"
#import "CQFindCarLogoListModel.h"
#import "CQFindCarLogoListTableViewCell.h"

@interface CQFindCarLogoListTableVC ()

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *enameArr; //首字母数组

@end

@implementation CQFindCarLogoListTableVC

static NSString *CQFindCarIdentifier = @"CQFindCarLogoListTableViewCellIdentifier";

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (NSMutableArray *)enameArr{
    if (!_enameArr) {
        _enameArr = [NSMutableArray array];
    }
    return _enameArr;
}


// 解析数据
- (void)getDataArray{
    [DownLoad downLoadWithUrl:KCQFindCarAPI resultBlock:^(NSDictionary *dictionary) {
        NSArray *arr = dictionary[@"result"];
        
        for (NSDictionary *dic in arr) {
            //       模型赋值
            CQFindCarLogoListModel *LogoModel = [CQFindCarLogoListModel findCarLogoListModelWithDic:dic];
            NSString *enameString = LogoModel.ename;
            //       模型添加到数组
            if (![self.enameArr containsObject:enameString]) {
                [self.enameArr addObject:enameString];
                NSMutableArray *groupArr = [NSMutableArray array];
                NSDictionary *groupDict = [NSDictionary dictionaryWithObject:groupArr forKey:enameString];
                [self.dataArr addObject:groupDict];
                [groupArr addObject:LogoModel];
                
            }else{
                NSMutableDictionary *dict = self.dataArr[[self.enameArr indexOfObject:enameString]];
                [dict[enameString] addObject:LogoModel];
                
            }
        }
        NSLog(@"%@",self.dataArr);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"车库";
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
    
    [self getDataArray];
    
    //    注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CQFindCarLogoListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CQFindCarIdentifier];
}
//  索引
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.enameArr;
}
//  section 的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.enameArr[section];
}
//  section 的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.enameArr.count;
}
//  row 的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = [self.dataArr[section] objectForKey:self.enameArr[section]];
    return arr.count;
}
//  创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CQFindCarLogoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CQFindCarIdentifier forIndexPath:indexPath];
    NSArray *arr = [self.dataArr[indexPath.section] objectForKey:self.enameArr[indexPath.section]];
    CQFindCarLogoListModel *logoListModel = arr[indexPath.row];
    cell.findCarLogoListModel = logoListModel;
    
    return cell;
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [self.dataArr[indexPath.section] objectForKey:self.enameArr[indexPath.section]];
    CQFindCarLogoListModel *logoListModel = arr[indexPath.row];
    self.cellblock(logoListModel.kindId,logoListModel.name);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

@end
