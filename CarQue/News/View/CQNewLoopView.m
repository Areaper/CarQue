//
//  CQNewLoopView.m
//  CarQue
//
//  Created by HJW-MAC on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewLoopView.h"
#import "CQNewsVC.h"

@interface CQNewLoopView() <UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;

//记录上一次看的图片
@property (nonatomic, assign) NSInteger lastImage;

@end

@implementation CQNewLoopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNewScrollViewView];
        [self setNewpageControlView];
    }
    
    
    return self;
    
    
    
}

#pragma mark 设置轮播图
- (void)setNewScrollViewView
{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height )];
    self.scrollView.backgroundColor = [UIColor cyanColor];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 6, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.bounces = NO;
   [self addSubview: _scrollView];
    for (int i = 0 ; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"load%d.png", i +1]];
       
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, self.frame.size.width, self.frame.size.height )];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview:imageView];
        
        
    }
 
}
    
    
    
    
#pragma mark 设置pageControl
- (void)setNewpageControlView{

    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _scrollView.frame.size.height-30 , SCREEN_WIDTH, 30)];
    _pageControl.backgroundColor = [UIColor whiteColor];
    
    _pageControl.numberOfPages = 5;
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    
    //一开始第几页
    self.pageControl.currentPage = 0 ;
    [self.pageControl addTarget:self action:@selector(pageControlAtion:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self addSubview:_pageControl];
    
    
}




#pragma mark pageControl方法
- (void)pageControlAtion:(UIPageControl *)pageControl
{
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * pageControl.currentPage ,0 );
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    self.pageControl.currentPage = (scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
    
}



@end
