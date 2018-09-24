//
//  Person.h
//  GCD-atomic
//
//  Created by chenshuang on 2018/9/20.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (assign, nonatomic) int age;
@property (copy, atomic) NSString *name;
@property (strong, atomic) NSMutableArray *data;

@end

/*
 nonatomic和atomic
 atom：原子，不可再分割的单位
 atomic：原子性
 
 给属性加上atomic修饰，可以保证属性的setter和getter都是原子性操作，也就是保证setter和gette内部是线程同步的
 
 // 加锁
 int a = 10;
 int b = 20;
 int c = a + b;
 // 解锁
 
 */

