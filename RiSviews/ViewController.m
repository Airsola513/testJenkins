//
//  ViewController.m
//  RiSviews
//
//  Created by Sola on 10/1/16.
//  Copyright © 2016 chinaj. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

//
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.btn setTitle:@"abcde" forState:UIControlStateNormal];
    
    [SVProgressHUD showWithStatus:@"Sora no kiseki  \n  CocoaPod get √"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
