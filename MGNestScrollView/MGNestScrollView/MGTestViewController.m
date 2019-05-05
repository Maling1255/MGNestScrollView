//
//  MGTestViewController.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGTestViewController.h"
#import "MGTableViewManager.h"

@interface MGTestViewController ()

@end

@implementation MGTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MGScrollContentView *scrollContentView = [MGTableViewManager sharedTableView].scrollContentView;
    
    scrollContentView.frame = CGRectMake(0, 64, 375, 667);
    
    [self.view addSubview:scrollContentView];

    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(popController)];
    self.navigationItem.leftBarButtonItem = backItem;

}

- (void)popController
{
    if (self.deallocVC) {
        self.deallocVC();
    }
    
    [self setupControllerTransitionDuration:0.01];
    
    [self.navigationController popViewControllerAnimated:NO];
}


- (void)setupControllerTransitionDuration:(CGFloat)duration
{
    CATransition *animation = [CATransition animation];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.type = @"fade";
    
    animation.duration = duration;
    
    animation.type = kCATransitionFade;
    
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}


- (void)dealloc
{
    NSLog(@"__%s__", __func__);
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
