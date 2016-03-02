//
//  CQFindCarVC.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQFindCarVC.h"
#import "DownLoad.h"
#import "CQFindCarLogoListModel.h"
#import "CQFindCarLogoListTableViewCell.h"


@interface CQFindCarVC ()

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *enameArr; //首字母数组

@end

@implementation CQFindCarVC

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
//            NSLog(@"%@",LogoModel);
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
    
    [self getDataArray];
    // Do any additional setup after loading the view.
    
//    注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CQFindCarLogoListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CQFindCarLogoListTableViewCellIdentifier"];
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
    CQFindCarLogoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CQFindCarLogoListTableViewCellIdentifier" forIndexPath:indexPath];
    NSArray *arr = [self.dataArr[indexPath.section] objectForKey:self.enameArr[indexPath.section]];
    CQFindCarLogoListModel *logoListModel = arr[indexPath.row];
    cell.findCarLogoListModel = logoListModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
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

