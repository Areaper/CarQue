//
//  CarQueAPI.h
//  CarQue
//
//  Created by HJW-MAC on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#ifndef CarQueAPI_h
#define CarQueAPI_h

//网络接口的宏定义

// 问答接口
#define KCQForumAPI @"http://api.daogou.bjzzcb.com/v3/questions/qlist?20=count&tord=up"
// 问题分类接口
#define KCQForumSortAPI @"http://api.daogou.bjzzcb.com/v3/questions/qclassify?test=test"

// 资讯模块

//视频接口
#define KCQVideotAPI @"http://api.daogou.bjzzcb.com/v2/article/list?cate=1449&count=10&startId=0&tagId=0&topicId=0&tord=up"
//导购接口
#define KCQShoppingAPI @"http://api.daogou.bjzzcb.com/v2/article/list?cate=1364&count=10&startId=0&tagId=0&topicId=0&tord=up"
//图趣接口
#define KCQPictureAPI @"http://api.daogou.bjzzcb.com/v2/article/list?cate=1363&count=20&tord=up&tagId=0&startId=0&topicId=0"
//最新新闻接口
#define KCQNewsAPI @"http://api.daogou.bjzzcb.com/v3/channel/home2_2_1?count=10&startId=0&tord=up"

//找车模块主接口
#define KCQFindCarAPI @"http://api.daogou.bjzzcb.com/m/spider/brandp?test=test"








#endif /* CarQueAPI_h */
