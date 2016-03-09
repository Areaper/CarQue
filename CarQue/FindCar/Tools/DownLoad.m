
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
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:UrlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            result(dictionary);
        }];
        [task resume];
}



@end
