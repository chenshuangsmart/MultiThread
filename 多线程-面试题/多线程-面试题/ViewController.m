//
//  ViewController.m
//  多线程-面试题
//
//  Created by chenshuang on 2018/9/16.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)test {
    NSLog(@"test");
}

/** 执行在主线程执行 */
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"1");
//    // 这句代码的本质是往Runloop中添加定时器
//    [self performSelector:@selector(test) withObject:nil afterDelay:.0];
//    NSLog(@"3");
//}

/** 创建一个新线程执行 */
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_async(queue, ^{
//        NSLog(@"1");
//        // 这句代码的本质是往Runloop中添加定时器
//        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
//        NSLog(@"3");
//    });
//}

/** 创建一个新线程执行,并且开启runloop */
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    dispatch_async(queue, ^{
//        NSLog(@"1");
//        // 这句代码的本质是往Runloop中添加定时器
//        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
//        NSLog(@"3");
//
//        // performSelector内部会将定时器添加到runloop中,runloop已经有定时器了,所以这里不需要再添加一个端口了
////        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    });
//}

/** 开启一个新线程,然后执行任务 */
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"1");
//    }];
//    [thread start];
//
//    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
//}

/** 开启一个新线程,并且在线程中启动runloop,然后执行任务 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");

        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [thread start];

    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
}



@end
