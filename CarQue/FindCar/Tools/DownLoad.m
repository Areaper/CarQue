
//
//  DownLoad.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "DownLoad.h"

@implementation DownLoad

+ (void)downLoadWithUrl:(NSString *)UrlString resultBlock:(Block)result{
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrentQueue, ^{
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:UrlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            result(data);
        }];
        [task resume];
//    });
    
}

@end
