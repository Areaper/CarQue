//
//  DownLoad.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block) (NSDictionary *);

typedef void (^block) (NSData *);

@interface DownLoad : NSObject

+ (void)downLoadWithUrl:(NSString *)UrlString resultBlock:(Block)result;

+ (void)downLoadWithImageUrl:(NSString *)ImageUrlString resultBlock:(block)result;

@end
