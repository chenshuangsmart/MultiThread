//
//  SynchronizedLockDemo.m
//  多线程安全+解决方案
//
//  Created by chenshuang on 2018/9/20.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "SynchronizedLockDemo.h"

@implementation SynchronizedLockDemo

- (void)__drawMoney {
    @synchronized([self class]) {
        [super __drawMoney];
    }
}

- (void)__saveMoney {
    @synchronized([self class]) { // objc_sync_enter
        [super __saveMoney];
    } // objc_sync_exit
}

- (void)__saleTicket {
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    
    @synchronized(lock) {
        [super __saleTicket];
    }
}

// 递归锁 - 可以递归
- (void)otherTest {
    @synchronized([self class]) {
        NSLog(@"123");
        [self otherTest];
    }
}

@end
