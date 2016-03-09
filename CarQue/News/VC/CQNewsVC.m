//
//  CQNewsVC.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsVC.h"
#import "CQNewsVCCell.h"
#import "CQNewLoopView.h"
#import "CQNewsManager.h"
#import "CQPictureVC.h"
#import "CQNewsDetailsVC.h"
#import "CQNewsLoopViewManager.h"
@interface CQNewsVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *modelArr;
@property (nonatomic, weak) CQNewLoopView *loopView;



@end

@implementation CQNewsVC


#pragma mark 设置tableview
-(NSMutableArray *)modelArray{
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}


- (void)setNewTabview
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- 100)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CQNewsVCCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"new"];
    [self.view addSubview:self.tableView];

    //设置Headerview
    if ( [CQNewsLoopViewManager shareManager].isnetWork) {
    CQNewLoopView *loopView = [[CQNewLoopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 10.0 * 3.24)];
    self.tableView.tableHeaderView = loopView;
    self.loopView = loopView;
     }
    
    //取消多余的线
    self.tableView.tableFooterView = [UIView new];


}
#pragma mark 处理News数据
- (void)dealWithData
{

 [[CQNewsManager shareManager]requestDatawithVC:self];
 [[CQNewsLoopViewManager shareManager]requestDatawithVC:self];
    
    

  _loopView.array = [[CQNewsLoopViewManager shareManager]returnLoopModel];
[[CQNewsLoopViewManager shareManager]returnLoopModel];


 dispatch_async(dispatch_get_main_queue(), ^{
     
        [self.tableView reloadData];
     
    });
    

    
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNewTabview];
    [self dealWithData];
    
    //点击图片push到相应网页
    [self.loopView addTapEventForImageViewWithBlock:^(NSString *Url) {
  
        self.newLoopBlock(Url);
                
    }];
    
   

    
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[CQNewsManager shareManager]returnModelDataArrayCount];
    
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQNewsVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"new" forIndexPath:indexPath];
    
    cell.Model = [[CQNewsManager shareManager]modelAtIndex:indexPath.row];
    
    

    return cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 89;
    
}

//选中cell方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  //取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
   NSString *url =  [[CQNewsManager shareManager]modelAtIndex:indexPath.row].artlistIdentifier;
    self.newsBlock(url);
    
    
    
    NSLog(@"跳转");
  
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
