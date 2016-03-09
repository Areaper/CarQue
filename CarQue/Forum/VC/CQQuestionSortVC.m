//
//  CQQuestionSortVC.m
//  CarQue
//
//  Created by leon on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQQuestionSortVC.h"
#import "CQResult.h"
#import "CustomCollectionCell.h"
#import "CQSortDetailTVC.h"



#define kSpacing 10
@interface CQQuestionSortVC ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSArray *colorArr;

@end

@implementation CQQuestionSortVC

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dealTheData];
    
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method
// 处理数据
- (void)dealTheData
{
    
    NSURL *url = [NSURL URLWithString:KCQForumSortAPI];
    NSData *data = [NSData dataWithContentsOfURL:url];
    // JSON 解析
    NSMutableDictionary *firstDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // 获取数据数组
    NSMutableArray *resultArr = firstDic[@"result"];
    // 初始化数据数组
    self.dataArr = [NSMutableArray array];
    // 将生成的 model 存入数组中
    for (NSDictionary *dic in resultArr) {
        CQResult *result = [[CQResult alloc] initWithDictionary:dic];
        [self.dataArr addObject:result];
    }
    
}

#pragma mark - event response

#pragma mark - delegate method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionReuse" forIndexPath:indexPath];
    
    cell.model = self.dataArr[indexPath.row];
    
    // 获取 cell 的背景颜色
    cell.backgroundColor = self.colorArr[indexPath.row % 6];
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CQSortDetailTVC *tvc = [CQSortDetailTVC new];
    CQResult *model = [self.dataArr objectAtIndex:indexPath.row];
    tvc.cId = model.cid;
    tvc.model = model;
    tvc.color = self.colorArr[indexPath.row % 6];
    [self.navigationController pushViewController:tvc animated:YES];
}

#pragma mark - setter and getter
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        // 绘制 layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = kSpacing;
        layout.minimumLineSpacing = kSpacing;
        CGFloat sizeWidth = (SCREEN_WIDTH - kSpacing * 3) / 2;
        layout.itemSize = CGSizeMake(sizeWidth, sizeWidth);
        layout.sectionInset = UIEdgeInsetsMake(kSpacing, kSpacing, kSpacing, kSpacing);
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 110) collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        // 设置代理人
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        // 注册
//        [_collectionView registerClass:[CustomCollectionCell class] forCellWithReuseIdentifier:@"collectionReuse"];
        [_collectionView registerNib:[UINib nibWithNibName:@"CustomCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collectionReuse"];
        // collectionView的分区头和分区尾必须经过注册
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    }
    return _collectionView;
}

-(NSArray *)colorArr
{
    if (_colorArr == nil) {
        
        _colorArr = @[shallowPurple, shallowGreen, shallowBlue, yama, forumGold, orangeRed];
        
        
    }
    return _colorArr;
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
