//
//  CQNewsVC.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsVC.h"
#import "CQNewsVCCell.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface CQNewsVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)UITableView *tableView;






@end

@implementation CQNewsVC

#pragma mark 设置轮播图
- (void)setNewScrollViewView
{

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 5 * 2)];
    self.scrollView.backgroundColor = [UIColor cyanColor];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    
    
    


    
    
    
    
#pragma mark 设置pageControl
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _scrollView.frame.size.height-30 , SCREEN_WIDTH, 30)];
    _pageControl.backgroundColor = [UIColor whiteColor];
    
    _pageControl.numberOfPages = 5;
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    
    //一开始第几页
    self.pageControl.currentPage = 0 ;
    [self.pageControl addTarget:self action:@selector(pageControlAtion:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:_pageControl];
  
    
    



}
#pragma mark 设置tableview

- (void)setNewTabview
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CQNewsVCCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"new"];
    [self setNewScrollViewView];
    self.tableView.tableHeaderView = self.scrollView;
    [self.view addSubview:self.tableView];
    







}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self setNewTabview];
    
    
    
}



#pragma mark pageControl方法
- (void)pageControlAtion:(UIPageControl *)pageControl
{
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * pageControl.currentPage ,0 );
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CQNewsVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"new" forIndexPath:indexPath];
    
    cell.textLabel.text = @"此处文本被网络数据替换";
    

    return cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;
    
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
