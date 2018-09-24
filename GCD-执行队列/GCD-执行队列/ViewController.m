//
//  ViewController.m
//  GCD-执行队列
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
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self interview01];
//    [self interview02];
//    [self interview03];
//    [self interview04];
//    [self interview05];
//    [self queueAddress];
    
    // 队列数组
//    [self groupQueue1];
    
    // 任务1和任务2执行完后再执行任务3和任务4
    [self groupQueue2];
}


/**
 同步执行 + 主队列
 dispatch_sync立马在当前线程同步执行任务
 */
- (void)interview01 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
}

/** dispatch_async不要求立马在当前线程同步执行任务 */
- (void)interview02 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
}

/** 同步执行 + 串行队列 */
- (void)interview03 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview04 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
        dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue2, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview05 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

/** 打印队列地址 */
- (void)queueAddress {
      dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
      dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
      dispatch_queue_t queue3 = dispatch_queue_create("queu3", DISPATCH_QUEUE_CONCURRENT);
      dispatch_queue_t queue4 = dispatch_queue_create("queu4", DISPATCH_QUEUE_CONCURRENT);
      dispatch_queue_t queue5 = dispatch_queue_create("queu5", DISPATCH_QUEUE_CONCURRENT);
      
      NSLog(@"%p %p %p %p %p", queue1, queue2, queue3, queue4, queue5);
}

/** 执行完任务1和任务2后再做事情 */
- (void)groupQueue1 {
    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("my_queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加异步任务
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1-%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务2-%@", [NSThread currentThread]);
        }
    });
    
    // 等前面的任务执行完毕后，会自动执行这个任务
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i = 0; i < 3; i++) {
                NSLog(@"任务3-%@", [NSThread currentThread]);
            }
        });
    });
    
    //    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    //        for (int i = 0; i < 5; i++) {
    //            NSLog(@"任务3-%@", [NSThread currentThread]);
    //        }
    //    });

}

/** 执行完任务1和任务2后再做事情 */
- (void)groupQueue2 {
    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("my_queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加异步任务
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1-%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务2-%@", [NSThread currentThread]);
        }
    });
    
    // 上面任务执行完后再执行
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务3-%@", [NSThread currentThread]);
        }
    });
    // 上面任务执行完后再执行
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务4-%@", [NSThread currentThread]);
        }
    });
}


@end
