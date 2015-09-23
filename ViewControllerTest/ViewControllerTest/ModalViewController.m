//
//  ModalViewController.m
//  ViewControllerTest
//
//  Created by Toshikazu Fukuoka on 2015/09/22.
//  Copyright © 2015年 travitu. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *aView = [UIButton buttonWithType:UIButtonTypeSystem];
    [aView setTitle:@"ボタン" forState:UIControlStateNormal];
    [aView addTarget:self action:@selector(closeModal:) forControlEvents:UIControlEventTouchUpInside];
    aView.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2);
    aView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:aView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
    
}

- (void)closeModal:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat h = screenBounds.size.height;
    CGFloat w = screenBounds.size.width;
    [UIView beginAnimations:nil context:nil];
    [self.navigationController.view setFrame:CGRectMake(0.0, h, w, h)];
    [UIView setAnimationDuration:0.4f];
    [self.navigationController.view setFrame:CGRectMake(0.0, 0.0, w, h)];
    [UIView commitAnimations];
    
}

- (UIModalPresentationStyle)modalPresentationStyle
{
    return UIModalPresentationOverCurrentContext;
}

- (BOOL)shouldAutorotate {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
