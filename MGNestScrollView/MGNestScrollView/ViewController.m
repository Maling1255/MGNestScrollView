//
//  ViewController.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "ViewController.h"
#import "MGAdvancedManagerView.h"
#import "MGTestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MGAdvancedManagerView *managerView = [[MGAdvancedManagerView alloc] initWithFrame:self.view.bounds];
    
    
    __weak typeof(self)weakSelf = self;
    
   __weak MGAdvancedManagerView *weakManagerView = managerView;
    [managerView setPushTestVC:^{
       
        NSLog(@"111111111111111");
        
        MGTestViewController *testVC = [[MGTestViewController alloc] init];
        
        [testVC setDeallocVC:^{
            
            [weakManagerView popView];
            
        }];
        
        [self setupControllerTransitionDuration:0.01];
        [self.navigationController pushViewController:testVC animated:NO];
        
    }];
    
    [self.view addSubview:managerView];
    
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




@end
