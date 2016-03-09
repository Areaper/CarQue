//
//  CQNewLoopView.m
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewLoopView.h"
#import "CQNewsVC.h"
#import "CQNewsLoopViewManager.h"
#import "LoopViewResult.h"

@interface CQNewLoopView() <UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property(nonatomic,retain)UILabel *textLable;
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,assign)NSInteger curPage;
@property(nonatomic,retain)NSMutableArray *curArray;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,retain)NSTimer *timer;


@end

@implementation CQNewLoopView

- (instancetype)initWithFrame:(CGRect)frame
{
    //设置宽 高
    _width = frame.size.width;
    _height= frame.size.height;
    self = [super initWithFrame:frame];
    if (self) {
        [self setNewScrollViewView];
        [self initWithTextLable];
        [self setNewpageControlView];
    }
    
    
    return self;
    
    
    
}

#pragma mark 设置轮播图
- (void)setNewScrollViewView
{
    
    //初始化
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
    //设置分页
    _scrollView.pagingEnabled = YES;
    //设置滑动区域
    _scrollView.contentSize = CGSizeMake(_width*3, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    //设置代理
    _scrollView.delegate = self;
    //设置当前显示的位置
    _scrollView.contentOffset = CGPointMake(_width, 0);
    self.curArray = [NSMutableArray arrayWithCapacity:3];
    
    
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //遍历创建显示的3张图片
    for (int a = 0; a <3 ; a++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_width*a, 0, _width, _height)];
      
        
        if (a==0) {
            
            imageView.image = [UIImage imageNamed:@"load1.png"];
            
        }
        else if (a==1)
        {
            imageView.image = [UIImage imageNamed:@"load1.png"];
        }
        else
        {
            imageView.image = [UIImage imageNamed:@"load1.png"];
        }
        
        [_scrollView addSubview:imageView];
    }
    
    CGFloat x = _scrollView.contentOffset.x;
    NSLog(@"x________%.f",x);
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAtion:)];
    
    
    [_scrollView addGestureRecognizer:tap];
    

    
    
    
    
    [self addSubview:_scrollView];
}




#pragma mark 设置pageControl
- (void)setNewpageControlView{
    
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH / 4 - 10, _height-30 ,  _width / 4, 30)];
    _pageControl.backgroundColor = [UIColor clearColor];
    
    
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor  grayColor];
    
    
 
    [self addSubview:_pageControl];
    
    
}

//初始化textlable
-(void)initWithTextLable
{
    self.textLable = [[UILabel alloc] initWithFrame:CGRectMake(5, _height-30, _width-100, 30)];
    _textLable.textColor = [UIColor whiteColor];
    _textLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.textLable];
    
}

-(void)setArray:(NSArray *)array
{  //我的数据源等于传递来的数据源
    _array = array;
    [self updateCurViewWithPage:0];
    self.pageControl.numberOfPages = _array.count;
    //设置定时器自动播放
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoPlay) userInfo:nil repeats:YES];
}
//定时器方法
-(void)autoPlay
{
    self.scrollView.contentOffset = CGPointMake(_width*2, 0);
}

//获取索引
-(NSInteger)upateCurpage:(NSInteger)page
{
    NSInteger count = self.array.count;//5
    
    return (count+page)%count;     // 5 -1 % 5 = 4
    
}
//替换数据源
-(void)updateCurViewWithPage:(NSInteger)page
{   //    one two three four five      curArray
    //page   图片名称数据源的索引      把图片找到的三张图片存起来之后的数组
    //0      4  0  1                   five  one  four
    //                                  0     1    2
    //获取当前显示的上一张图片的索引
    //1      0  1  2                    one two three
    //                                  0    1   2
    
    
    
    
    NSLog(@"updateCurViewWithPage");
    NSInteger pre = [self upateCurpage:page - 1]; // 4
    //当前显示的索引
    _curPage = [self upateCurpage:page];         //0
    //获取当前显示的下一张图片的索引
    NSInteger last = [self upateCurpage:page+1];  //1
    //删除数组里的元素
    [self.curArray removeAllObjects];
    //获取我当前显示的三张图片
   
   //取出array对应的url
    [self.curArray addObject:((LoopViewResult*)self.array[pre]).url];    //five   0
    [self.curArray addObject:((LoopViewResult*)self.array[_curPage]).url]; //one  1
    [self.curArray addObject:((LoopViewResult*)self.array[last]).url];     //two  2
    //获取scrollView的所有子试图
    NSArray *arrays = self.scrollView.subviews;
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = arrays[i];
         [imageView sd_setImageWithURL:self.curArray[i] placeholderImage:[UIImage imageNamed:@"load1.png"]];
       // [imageView sd_setImageWithURL:self.curArray[i]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        if (i == 1) {
            // NSLog(@"i___%d",i);
            self.textLable.text = ((LoopViewResult*)self.array[_curPage]).meta;
           
        }
    }
    NSLog(@"before______%.f",self.scrollView.contentOffset.x);
    //设置当前显示的位置
    self.scrollView.contentOffset = CGPointMake(_width, 0);
    NSLog(@"behind_____%.f",self.scrollView.contentOffset.x);
    //设置pagecontrl当前显示的索引
    self.pageControl.currentPage = _curPage;
    
}
//每次滑动都要调用该方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    NSLog(@"scrollViewDidScroll x______%@",NSStringFromCGPoint(scrollView.contentOffset));
    
    if (x >= _width*2) {//从右向左滑动
        // NSLog(@"y2______%.f",x);
        [self updateCurViewWithPage:_curPage+1];
    }else if (x <= 0 ){//从左向右滑动
        // NSLog(@"y3______%.f",x);
        [self updateCurViewWithPage:_curPage-1];
    }
}

//开始拖拽
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"start_____%.f",self.scrollView.contentOffset.x);
    //关掉定时器
    [self.timer invalidate];
    self.timer = nil;
}

//开始减速
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x;
    
    NSLog(@"contentoffset________%.f",x);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoPlay) userInfo:nil repeats:YES];
    
}

- (void)addTapEventForImageViewWithBlock:(addTapEventForImageViewWithBlock)block
{
    if (self.block != block) {
        self.block = block;
    }

}

//把滚动视图 当前对应的图片的carid传递到新闻页面
- (void)tapAtion:(UITapGestureRecognizer *)tap
{
    if (self.block) {
        self.block(((LoopViewResult*)self.array[_curPage]).articleId);
    }
   

}




@end
