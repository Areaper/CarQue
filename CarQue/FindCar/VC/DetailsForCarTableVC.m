//
//  DetailsForCarTableVC.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "DetailsForCarTableVC.h"
#import "DownLoad.h"
#import "DetailsForCarModel.h"
#import "DetailsForCarTableViewCell.h"
#import "DetailsForCarTableHeaderView.h"

@interface DetailsForCarTableVC ()

@property (nonatomic,assign)NSInteger carNumber;

@property (nonatomic,copy)NSString *params_value_type;

@property (nonatomic,strong)NSMutableArray *sectionsArr;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation DetailsForCarTableVC

- (NSMutableArray *)sectionsArr{
    if (!_sectionsArr) {
        _sectionsArr = [NSMutableArray array];
    }
    return _sectionsArr;
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"参数配置";
    self.tableView.allowsSelection = NO;

    //    数据加载
    [self getData];
    //添加按钮和手势
    [self addGestureItemAndRecognizer];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailsForCarTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailsForCarTableViewCellidenf"];
    
    [self creatTableHeaderView];
}
- (void)creatTableHeaderView{
    self.tableView.tableHeaderView = [[DetailsForCarTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30) titleLabText:self.headerViewName];
}
//    数据加载
- (void)getData{
    [DownLoad downLoadWithUrl:DetailsForCarAPI resultBlock:^(NSDictionary *allDict) {
        NSDictionary *dic1 = allDict[@"result"];
//        self.headerViewName = dic1[@"name"];
        self.params_value_type = dic1[@"params_value_type"];
        NSArray *allparamsArray = dic1[@"allparams"];
        
        for (NSDictionary *dic2 in allparamsArray) {
            [self.sectionsArr addObject:dic2[@"name"]];
            NSArray *listArr = dic2[@"list"];
            NSMutableArray *listMutableArray = [NSMutableArray array];
            for (NSDictionary *dic3 in listArr) {
               DetailsForCarModel *model = [DetailsForCarModel modelObjectWithDictionary:dic3];
                [listMutableArray addObject:model];
            }
            NSDictionary *listDic = [NSDictionary dictionaryWithObject:listMutableArray forKey:dic2[@"name"]];
            [self.dataArr addObject:listDic];
        }
        
//        self.headerView.titleLab.text = self.headerViewName;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    
    }];
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
    return [self.dataArr[section][self.sectionsArr[section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsForCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailsForCarTableViewCellidenf" forIndexPath:indexPath];
    DetailsForCarModel *model = self.dataArr[indexPath.section][self.sectionsArr[indexPath.section]][indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionsArr[section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
