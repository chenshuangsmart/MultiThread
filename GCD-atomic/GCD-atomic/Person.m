//
//  Person.m
//  GCD-atomic
//
//  Created by chenshuang on 2018/9/20.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name {
    // 加锁
    _name = name;
    // 解锁
}

- (NSString *)name {
// 加锁
    return _name;
// 解锁
}

@end
