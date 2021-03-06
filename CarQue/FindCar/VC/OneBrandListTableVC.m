//
//  OneBrandListTableVC.m
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "OneBrandListTableVC.h"
#import "OneBrandListTableViewCell.h"
#import "OneBrandListModel.h"
#import "DownLoad.h"

#import "UIImageView+WebCache.h"

#import "OneKindListTableVC.h"

@interface OneBrandListTableVC ()

@property (nonatomic,strong)UILabel *headLab;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *sectionArr;

@property (nonatomic,copy)NSString *brandID;

@end

@implementation OneBrandListTableVC

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (NSMutableArray *)sectionArr{
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray array];
    }
    return _sectionArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(SCREEN_WIDTH, 0, 0, SCREEN_HEIGHT);
    self.tableView.rowHeight = 80;

  //    加载数据
    [self getData];
//创建tableView的头视图
    [self creatTableViewHeadView];
}
//    得到数据
- (void)getData{
    __weak OneBrandListTableVC *weakBrandTVC = self;
    self.getblock =  ^(NSString *kindID,NSString *name){
        weakBrandTVC.headLab.text = [@"    " stringByAppendingString:name];
        
        if (![kindID isEqualToString:weakBrandTVC.brandID] || weakBrandTVC.dataArray.count == 0) {
            [weakBrandTVC.dataArray removeAllObjects];
            [weakBrandTVC.sectionArr removeAllObjects];
            
//        NSLog(@"_____________%@",weakBrandTVC.brandID);
        
        [DownLoad downLoadWithUrl:[OneBrandListCarAPI stringByAppendingString:kindID] resultBlock:^(NSDictionary * dictionary) {
            NSArray *resultArr = dictionary[@"result"];
            
            for (NSDictionary *dict in resultArr) {
                OneBrandListModel *model = [OneBrandListModel modelObjectWithDictionary:dict];
                NSString *bidnameString = model.bidname;
                if (![weakBrandTVC.sectionArr containsObject:bidnameString]) {
                    [weakBrandTVC.sectionArr addObject:bidnameString];
                    NSMutableArray *groupArr = [NSMutableArray arrayWithObject:model];
                    NSMutableDictionary *groupDict = [NSMutableDictionary dictionaryWithObject:groupArr forKey:bidnameString];
                    [weakBrandTVC.dataArray addObject:groupDict];
                }else{
                    NSInteger index = [weakBrandTVC.sectionArr indexOfObject:bidnameString];
                    NSMutableArray *groupArr = [weakBrandTVC.dataArray[index] objectForKey:bidnameString];
                    [groupArr addObject:model];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakBrandTVC.tableView reloadData];
            });
        }];
        }
        weakBrandTVC.brandID = kindID;
    };
}
//创建头部视图
- (void)creatTableViewHeadView{
    self.headLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 30)];
    self.headLab.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = self.headLab;
}
//section 表头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionArr[section];
}

#pragma mark - Table view data source
//section 数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArr.count;
}
//rows 的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.dataArray[section];
    return [dic[self.sectionArr[section]] count];
}

//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *OneBrandCellid = @"OneBrandListTableViewCellidenf";
    
    OneBrandListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OneBrandCellid];
    if (!cell) {
        NSArray *arr = [[NSBundle mainBundle]loadNibNamed:@"OneBrandListTableViewCell" owner:nil options:nil];
        cell = [arr objectAtIndex:0];
    }
    OneBrandListModel *model = self.dataArray[indexPath.section][self.sectionArr[indexPath.section]][indexPath.row];
    cell.model = model;
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    return cell;
}
//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OneBrandListModel *model = self.dataArray[indexPath.section][self.sectionArr[indexPath.section]][indexPath.row];
    self.pushBlock(model.pserid,model.price,model.name);
    
}


@end
