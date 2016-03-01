



//
//  CQFindCarLogoListModel.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQFindCarLogoListModel.h"

@implementation CQFindCarLogoListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.kindId = value;
    }
}



@end
