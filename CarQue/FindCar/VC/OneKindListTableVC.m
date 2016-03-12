//
//  OneKindListTableVC.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "OneKindListTableVC.h"
#import "OneKindListModel.h"
#import "OneKindListTableViewCell.h"
#import "OnekindListTableHeadView.h"
#import "DownLoad.h"
#import "UIButton+WebCache.h"
#import "DetailsForCarTableVC.h"

@interface OneKindListTableVC ()

//  比车数量
@property (nonatomic,assign)NSInteger carNumber;
//  图片数量
@property (nonatomic,copy)NSString *image_count;
//  图片URL字符串数组
@property (nonatomic,strong)NSMutableArray *imageUrlArray;
//  首张图片
@property (nonatomic,strong)NSString *topImageStr;

@property (nonatomic,strong)NSMutableArray *sectionsArr;
@property (nonatomic,strong)NSMutableArray *rowsDataArray;

@property (nonatomic,strong)OnekindListTableHeadView *headView;

@end

@implementation OneKindListTableVC
- (NSMutableArray *)sectionsArr{
    if (!_sectionsArr) {
        _sectionsArr = [NSMutableArray array];
    }
    return _sectionsArr;
}
- (NSMutableArray *)rowsDataArray{
    if (!_rowsDataArray) {
        _rowsDataArray = [NSMutableArray array];
    }
    return _rowsDataArray;

}
- (NSMutableArray *)imageUrlArray{
    if (!_imageUrlArray) {
        _imageUrlArray = [NSMutableArray array];
    }
    return _imageUrlArray;
}

//   添加tableHeadView
- (OnekindListTableHeadView *)headView{
    if (!_headView) {
        _headView = [[OnekindListTableHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3 + 65) titleLab:self.topTitleStr priceLab:self.priceStr];
    }
    return _headView;
}

//    加载数据方法
- (void)getData{
    
    [DownLoad downLoadWithUrl:[OneKindListCarAPI stringByAppendingString:self.pseridID] resultBlock:^(NSDictionary *dictionary) {
        NSDictionary *resultDict = dictionary[@"result"];
        NSArray *carListArr = resultDict[@"carlist"];
        for (NSDictionary *carDic in carListArr) {
            OneKindListModel *model = [OneKindListModel modelObjectWithDictionary:carDic];
            NSString *sectionString = [NSString stringWithFormat:@"%@L %@ %.f马力",model.m_disl,model.m_working,model.mali];
            if (![self.sectionsArr containsObject:sectionString]) {
                [self.sectionsArr addObject:sectionString];
                NSMutableArray *modelArray = [NSMutableArray arrayWithObject:model];
                NSMutableDictionary *modelDic = [NSMutableDictionary dictionaryWithObject:modelArray forKey:sectionString];
                [self.rowsDataArray addObject:modelDic];
            }else{
                NSMutableDictionary *modelDic = [self.rowsDataArray objectAtIndex:[self.sectionsArr indexOfObject:sectionString]];
                NSMutableArray *modelArr =  modelDic[sectionString];
                [modelArr addObject:model];
            }
        }
        
//        获取图片数组
        NSArray *image_listArray = resultDict[@"img_list"];
        for (NSDictionary *iamgeUrlDic in image_listArray) {
            [self.imageUrlArray addObject:iamgeUrlDic[@"url"]];

            NSLog(@"----------%@",self.imageUrlArray);
        }
        
        self.topImageStr = resultDict[@"topimg"];
        self.image_count = resultDict[@"img_count"];
        self.topTitleStr = resultDict[@"topimg_title"];
        
        self.headView.imageCountLab.text = [NSString stringWithFormat:@"共%@张图片",self.image_count];
        [self.headView.topImageBut sd_setBackgroundImageWithURL:[NSURL URLWithString:self.topImageStr] forState:UIControlStateNormal];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"车系信息";
//    加载数据
    [self getData];
//添加按钮和手势
    [self addGestureItemAndRecognizer];
    
    self.tableView.tableHeaderView = self.headView;
}

//添加按钮和手势
- (void)addGestureItemAndRecognizer{
    //左键
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"left"] style:UIBarButtonItemStylePlain target:self action:@selector(backActionVC:)];
    //   导航栏右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:[NSString stringWithFormat:@"比车(%ld)",self.carNumber] style:UIBarButtonItemStylePlain target:self action:@selector(compareVC:)];
    //    右扫手势返回
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backActionVC:)];
    [self.view addGestureRecognizer:rightSwipe];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
}

//左键返回
- (void)backActionVC:(UIBarButtonItem *)backBarButtonItem{
    [self.navigationController popViewControllerAnimated:YES];
}
//  右按钮比车
- (void)compareVC:(UIBarButtonItem *)rightBarButton{
    NSLog(@"比车啦啦啦啦啦啦啦啦啦");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionsArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowsDataArray[section][self.sectionsArr[section]] count];;
}

//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"Identifierstr";
    OneKindListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"OneKindListTableViewCell" owner:nil options:nil] lastObject];
    }
    
    OneKindListModel *model = self.rowsDataArray[indexPath.section][self.sectionsArr[indexPath.section]][indexPath.row];
    cell.model = model;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionsArr[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsForCarTableVC *detailTVC = [[DetailsForCarTableVC alloc]init];
    OneKindListModel *model = self.rowsDataArray[indexPath.section][self.sectionsArr[indexPath.section]][indexPath.row];
    detailTVC.headerViewName = model.name;
    [self.navigationController pushViewController:detailTVC animated:YES];
    
}


@end
