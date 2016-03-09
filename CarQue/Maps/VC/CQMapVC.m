//
//  CQMapVC.m
//  CarQue
//
//  Created by leon on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQMapVC.h"

@interface CQMapVC ()


@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) BMKLocationService *locService;

@property (nonatomic, strong) BMKPoiSearch *poiSearch;

//@property (nonatomic, strong) BMKNearbySearchOption *option;
@property (nonatomic, assign) CLLocationCoordinate2D coord;


@end

@implementation CQMapVC


#pragma mark - life circle

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    [self.locService startUserLocationService];
    
    
    self.poiSearch = [[BMKPoiSearch alloc] init];
    self.poiSearch.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    [_locService stopUserLocationService];
    
    
    self.poiSearch.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view = self.mapView;
    
    // 定位功能
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    
    _mapView.mapType = BMKMapTypeStandard;//设置地图为空白类型
    
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"点我搜索" forState:UIControlStateNormal];
//    button.frame = CGRectMake(100, 100, 100, 30);
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(buttonAction:) userInfo:nil repeats:NO];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
}

- (void)buttonAction:(UIButton *)button
{
    
    
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc] init];
    citySearchOption.pageIndex = 0;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= @"广州";
    citySearchOption.keyword = @"汽车4S";
    BOOL flag = [self.poiSearch poiSearchInCity:citySearchOption];
   
    
    if(flag)
    {
        
        NSLog(@"城市内检索发送成功");
    }
    else
    {
        
        NSLog(@"城市内检索发送失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}

#pragma mark - private method

#pragma mark - event response

#pragma mark - delegate method

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"heading is %@",userLocation.heading);
    [_mapView updateLocationData:userLocation];
    
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    
    
    //普通态
    //以下_mapView为BMKMapView对象
    _mapView.showsUserLocation = YES;//显示定位图层
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
    [_mapView updateLocationData:userLocation];
    
    
    
    
    // 获取我当前的位置
    CLLocation *newLocation = userLocation.location;
    
    
    // 获取经纬度
    CLLocationCoordinate2D coord = newLocation.coordinate;
    self.coord = coord;
    float sp = newLocation.speed;
    // 位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    // 使用位置反编码对象获取位置信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *pl in placemarks) {
            NSLog(@"******* = %@", pl.name);
            NSLog(@"*******thoroughfare = %@", pl.thoroughfare);
            NSLog(@"*******subThoroughfare = %@", pl.subThoroughfare);
            NSLog(@"*******locality = %@", pl.locality);
            
        }
    }];
    NSLog(@"经度%f 纬度%f 速度%f", coord.longitude, coord.latitude, sp);
    
    

    
    
    
}

//实现PoiSearchDeleage处理回调结果
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResultList errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
    }
    else if (error == BMK_SEARCH_AMBIGUOUS_KEYWORD){
        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
        // result.cityList;
        NSLog(@"起始点有歧义");
    } else {
        NSLog(@"抱歉，未找到结果");
    }
    
    
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        NSMutableArray *annotations = [NSMutableArray array];
        for (int i = 0; i < poiResultList.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [poiResultList.poiInfoList objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            item.coordinate = poi.pt;
            item.title = poi.name;
            [annotations addObject:item];
        }
        [_mapView addAnnotations:annotations];
        [_mapView showAnnotations:annotations animated:YES];
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
    
    
    
    
    
}

- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    // 生成重用标示identifier
    NSString *AnnotationViewID = @"xidanMark";
    
    // 检查是否有重用的缓存
    BMKAnnotationView* annotationView = [view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    // 缓存没有命中，自己构造一个，一般首次添加annotation代码会运行到此处
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        ((BMKPinAnnotationView*)annotationView).pinColor = BMKPinAnnotationColorRed;
        // 设置重天上掉下的效果(annotation)
        ((BMKPinAnnotationView*)annotationView).animatesDrop = YES;
    }
    
    // 设置位置
    annotationView.centerOffset = CGPointMake(0, -(annotationView.frame.size.height * 0.5));
    annotationView.annotation = annotation;
    // 单击弹出泡泡，弹出泡泡前提annotation必须实现title属性
    annotationView.canShowCallout = YES;
    // 设置是否可以拖拽
    annotationView.draggable = NO;
    
    return annotationView;
}
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    [mapView bringSubviewToFront:view];
    [mapView setNeedsDisplay];
}

#pragma mark - setter and getter

- (BMKMapView *)mapView
{
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
        
    }
    return _mapView;
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
