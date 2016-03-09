//
//  CQSortDetailTVC.m
//  CarQue
//
//  Created by leon on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQSortDetailTVC.h"
#import "CQHotlist.h"
#import "CQHotListCell.h"
#import "CQHotDetailVC.h"
#import "CQHeaderView.h"
#import "CalculateHeight.h"

@interface CQSortDetailTVC ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) CQHeaderView *headerView;

@end

@implementation CQSortDetailTVC


#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dealTheData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CQHotListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"sortDetailReuse"];
    
    self.headerView = [[CQHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) withColor:self.color name:self.model.name number:[NSString stringWithFormat:@"%@人问过", self.model.qNums]];
    self.tableView.tableHeaderView = self.headerView;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method

- (void)dealTheData{
    // 初始化数据数组
    self.dataArr = [NSMutableArray array];
    NSString *urlStr = [kCQForumSortDetailAPI stringByReplacingOccurrencesOfString:@"****" withString:self.cId];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *firstDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *resultArr = firstDic[@"result"];
    for (NSDictionary *dic in resultArr) {
        CQHotlist *model = [[CQHotlist alloc] initWithDictionary:dic];
        [self.dataArr addObject:model];
    }
    
    
}

#pragma mark - event response

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotDetailVC *detailVC = [CQHotDetailVC new];
    CQHotlist *model = self.dataArr[indexPath.row];
    detailVC.qId = model.qId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - delegate method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sortDetailReuse"];
    CQHotlist *model = self.dataArr[indexPath.row];
    cell.hotModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQHotlist *model = [CQHotlist new];
    model = self.dataArr[indexPath.row];
    
    CGFloat labelHeight = [CalculateHeight heightWithString:model.title lableWidth:SCREEN_WIDTH - 24 font:14];
    
    CGFloat substract = labelHeight - 45;
    
    
    return 120 + substract;
}
#pragma mark - setter and getter




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
