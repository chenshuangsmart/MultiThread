//
//  LockBase.h
//  多线程安全+解决方案
//
//  Created by chenshuang on 2018/9/16.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockBase : NSObject

/** 存钱 取钱 */
- (void)moneyTest;

/** 卖票操作 */
- (void)ticketTest;

/** 其他操作,交给子类去实现 */
- (void)otherTest;

#pragma mark - 暴露给子类去使用
// 存钱
- (void)__saveMoney;
// 取钱
- (void)__drawMoney;
// 卖票
- (void)__saleTicket;

@end
