//
//  LockBase.m
//  多线程安全+解决方案
//
//  Created by chenshuang on 2018/9/16.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "LockBase.h"

@interface LockBase()
/** 钱 */
@property (assign, nonatomic) int money;
/** 剩余票数 */
@property (assign, nonatomic) int ticketsCount;
@end

@implementation LockBase

#pragma mark - 存钱 取钱

/** 存钱、取钱演示 */
- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

/** 存钱 */
- (void)__saveMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}

/** 取钱 */
- (void)__drawMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}

#pragma mark - 卖票

/** 卖票演示 */
- (void)ticketTest {
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
}

/** 卖1张票 */
- (void)__saleTicket {
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%d张票 - %@", oldTicketsCount, [NSThread currentThread]);
}

#pragma mark - 其他操作
- (void)otherTest {
    // 交给子类去实现
}

@end
