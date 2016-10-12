//
//  ViewController.m
//  RiSviews
//
//  Created by Sola on 10/1/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "MONBlock.h"
#import "UIGestureRecognizer+Block.h"


#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
//#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(GCC error(MSG)))

#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__) " "

#define KEYWORDIFY   \
    try {            \
    } @catch (...) { \
    }
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end


@implementation ViewController


#warning need to  aa
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @TODO("there is some thing to nedd");
    @TODO("there is some thing to nedd");
    @TODO("there is some thing to nedd");


    [self.btn setTitle:@"abcde" forState:UIControlStateNormal];

    //    [SVProgressHUD showWithStatus:@"Sora no kiseki  \n  CocoaPod get √ \n GitHub trigger"];

    //    [self groupSync4];
    //    [self groupSync3];
    [self backgroudThreadAddImag];

    //    [self.imgView addGestureRecognizer:[]


    [self addGesture];


    if (true) NSLog(@"%s", __func__);
}

- (void)addGesture
{
    self.imgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addGestureTarger)];
    [self.imgView addGestureRecognizer:tap];

    // target 可以一对多   传递参数是trick
    [self.btn addTarget:self action:@selector(addGestureTarger) forControlEvents:UIControlEventTouchUpInside];
    [self.btn addTarget:self action:@selector(addGestureTarger2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addGesture2
{
    self.imgView.userInteractionEnabled = YES;
    [self.imgView addGestureRecognizer:[UITapGestureRecognizer sl_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        NSLog(@"%s", __func__);

    }]];
}

- (void)addGestureTarger
{
    NSLog(@"%s", __func__);
}

- (void)addGestureTarger2
{
    NSLog(@"%s", __func__);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)backgroudThreadAddImag
{
    //    self.imgView.image = [UIImage imageNamed:@"0.png"];


    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        // [MONBlock performBlock:^{
        //     self.imgView.image = [UIImage imageNamed:@"0.png"];
        //
        // } afterDelay:0];

        //    dispatch_async(dispatch_get_main_queue(), ^{
        //        self.imgView.image = [UIImage imageNamed:@"0.png"];
        //
        //    });
        [self performSelectorOnMainThread:@selector(foo) withObject:self waitUntilDone:YES];

        //    [self performSelector:@selector(foo)];
    });
}


- (void)foo
{
    self.imgView.image = [UIImage imageNamed:@"0.png"];
}

- (void)groupSync
{
    dispatch_queue_t disqueue = dispatch_queue_create("com.shidaiyinuo.NetWorkStudy", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t disgroup = dispatch_group_create();
    dispatch_group_async(disgroup, disqueue, ^{
        NSLog(@"任务一完成");
    });
    dispatch_group_async(disgroup, disqueue, ^{
        sleep(3);
        NSLog(@"任务二完成");
    });
    dispatch_group_notify(disgroup, disqueue, ^{
        NSLog(@"dispatch_group_notify 执行");
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        NSLog(@"dispatch_group_wait 开始");

        // 注意这里wait 会阻塞，不能放在主线程中   这里的等待时间是 是等待的上限，过期不候的意思。可以随时可以提前结束
        dispatch_group_wait(disgroup, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
        NSLog(@"dispatch_group_wait 结束");
    });


    //    NSLog(@"dispatch_group_wait 尝试阻塞线程");
    //    dispatch_group_wait(disgroup, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
    //    NSLog(@"dispatch_group_wait 阻塞线程结束");
}


- (void)groupSync2
{
    dispatch_queue_t dispatchQueue = dispatch_queue_create("ted.queue.next1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatchQueue, ^() {
        sleep(5);
        NSLog(@"任务一完成");
    });
    dispatch_group_async(dispatchGroup, dispatchQueue, ^() {
        sleep(6);
        NSLog(@"任务二完成");
    });
    //    这里使用了另个queue
    dispatch_group_async(dispatchGroup, globalQueue, ^{
        sleep(10);
        NSLog(@"任务三完成");
    });

    // 证明了 Group 跨队列也是没有什么问题的
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^() {
        NSLog(@"notify：任务都完成了");
    });
}

// 非常适合处理异步任务的同步
- (void)groupSync3
{
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_enter(group);

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5);
        NSLog(@"任务一完成");
        dispatch_group_leave(group);
    });

    dispatch_group_enter(group);

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(8);
        NSLog(@"任务二完成");
        dispatch_group_leave(group);
    });

    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务完成");
    });
}

- (void)groupSync4
{
    dispatch_queue_t dispatchQueue = dispatch_queue_create("com.shidaiyinuo.NetWorkStudy1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatchQueue, ^() {


        dispatch_async(globalQueue, ^{

            sleep(3);
            NSLog(@"任务一完成");
        });

    });


    dispatch_group_async(dispatchGroup, dispatchQueue, ^() {

        dispatch_async(globalQueue, ^{
            //这里模拟了异步的网络请求返回
            sleep(2);
            NSLog(@"任务二完成");
        });

        NSLog(@"dispatchGroup 执行完了");

    });


    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^() {
        NSLog(@"dispatch_group_notify 被执行了");
    });
}


@end
