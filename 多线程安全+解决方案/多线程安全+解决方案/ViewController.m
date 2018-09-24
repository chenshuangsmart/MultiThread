//
//  ViewController.m
//  多线程安全+解决方案
//
//  Created by chenshuang on 2018/9/16.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "MutexLockDemo.h"
#import "MutexLockDemo2.h"
#import "MutexLockDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueLockDemo.h"
#import "SemaphoreLockDemo.h"
#import "SynchronizedLockDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.OSSpinLock
//    OSSpinLockDemo *spinLock = [[OSSpinLockDemo alloc] init];
//    [spinLock moneyTest];
//    [spinLock ticketTest];
    
    // 2.os_unfair_lock
//    OSUnfairLockDemo *unfairLock = [[OSUnfairLockDemo alloc] init];
//    [unfairLock moneyTest];
//    [unfairLock ticketTest];
    
    // 3.MutexLock
//    MutexLockDemo *mutexLock = [[MutexLockDemo alloc] init];
//    [mutexLock moneyTest];
//    [mutexLock ticketTest];
    
    // 4. MutexLock递归锁
//    MutexLockDemo2 *mutexLock2 = [[MutexLockDemo2 alloc] init];
//    [mutexLock2 otherTest];
    
    // 5.生产者消费者
//    MutexLockDemo3 *mutexLock3 = [[MutexLockDemo3 alloc] init];
//    [mutexLock3 otherTest];
    
    // 6.NSLock
//    NSLockDemo *lockDemo = [[NSLockDemo alloc] init];
//    [lockDemo moneyTest];
//    [lockDemo ticketTest];
    
    // 7.NSCondition
//    NSConditionDemo *conditionDemo = [[NSConditionDemo alloc] init];
//    [conditionDemo otherTest];
    
    // 8.NSConditionLock
//    NSConditionLockDemo *conditionLock = [[NSConditionLockDemo alloc] init];
//    [conditionLock otherTest];
    
    // 9.串行队列
//    SerialQueueLockDemo *serialQueueLock = [[SerialQueueLockDemo alloc] init];
//    [serialQueueLock ticketTest];
//    [serialQueueLock moneyTest];
    
    // 10.信号量
//    SemaphoreLockDemo *semaphoreLock = [[SemaphoreLockDemo alloc] init];
    // 多条线程同步执行
//    [semaphoreLock otherTest];
    // 卖票
//    [semaphoreLock ticketTest];
    // 存|取钱
//    [semaphoreLock moneyTest];
    
    // 11.Synchronized
    SynchronizedLockDemo *synchronizeLock = [[SynchronizedLockDemo alloc] init];
    [synchronizeLock ticketTest];
    [synchronizeLock moneyTest];
}

@end
