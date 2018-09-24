//
//  main.m
//  GCD-atomic
//
//  Created by chenshuang on 2018/9/20.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
Person *p = [[Person alloc] init];
p.data = [NSMutableArray array];

// 以下操作就不能保证线程安全了
for (int i = 0; i < 10; i++) {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [p.data addObject:@"1"];
    });
}
    }
    return 0;
}
