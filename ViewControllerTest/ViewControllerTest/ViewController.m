//
//  ViewController.m
//  ViewControllerTest
//
//  Created by Toshikazu Fukuoka on 2015/09/22.
//  Copyright © 2015年 travitu. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonTap:(id)sender {
    
    // 適当にUIViewControllerを作って...
    ModalViewController* bViewController = [[ModalViewController alloc] init];
    CGRect screen = [[UIScreen mainScreen] bounds];
    bViewController.view.frame = CGRectMake(0.0, 0.0, screen.size.width, screen.size.height);
    bViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    
    if([[UIDevice currentDevice].systemVersion floatValue] < 8.0){
        self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    [self presentViewController:bViewController animated:YES completion:nil];
}

- (BOOL)shouldAutorotate {
    return YES;
}

@end
