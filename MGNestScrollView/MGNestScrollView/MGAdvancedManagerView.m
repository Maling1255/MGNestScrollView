//
//  MGAdvancedManagerView.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGAdvancedManagerView.h"
#import "UIView+frame.h"
#import "MGTableViewManager.h"
@interface MGAdvancedManagerView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) UILabel *tet;

@end
@implementation MGAdvancedManagerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    _contentScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _contentScrollView.delegate = self;
    [self addSubview:_contentScrollView];
    
    
    
    UILabel *tet = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MGScreenWidth, 700)];
    self.tet = tet;
    tet.backgroundColor = [UIColor cyanColor];
    tet.numberOfLines = 0;
    tet.text = @"ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss";
    [_contentScrollView addSubview:tet];
    
    
    
    MGScrollContentView *scrollContentView = [MGTableViewManager sharedTableView].scrollContentView;
    
    scrollContentView.frame = CGRectMake(0, tet.bottom, MGScreenWidth, self.height);
    [_contentScrollView addSubview:scrollContentView];
    
    _contentScrollView.contentSize = CGSizeMake(MGScreenWidth, scrollContentView.bottom);
    
}

- (void)popView
{
    
    MGScrollContentView *scrollContentView = [MGTableViewManager sharedTableView].scrollContentView;
    scrollContentView.frame = CGRectMake(0, self.tet.bottom, MGScreenWidth, self.height);
    [_contentScrollView addSubview:scrollContentView];
    
    _contentScrollView.contentSize = CGSizeMake(MGScreenWidth, scrollContentView.bottom);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [self.contentScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    });
    
    
    [MGTableViewManager sharedTableView].canScroll = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"Y: %f", scrollView.contentOffset.y);
    
    CGFloat YY = scrollView.contentOffset.y;
    
    if (YY >= 636) {
        [_contentScrollView setContentOffset:CGPointMake(0, 636)];
        
        if ([MGTableViewManager sharedTableView].canScroll == NO) {
        
            NSLog(@"ssssssssssssssssssssssssssssssssssssss: %f", YY);
            
            if (self.pushTestVC) {
                self.pushTestVC();
            }
            
            [MGTableViewManager sharedTableView].canScroll = YES;
            
            [MGTableViewManager sharedTableView].scrollContentView.scrollEnableds = YES;
        }
    } else {
        
        [MGTableViewManager sharedTableView].scrollContentView.scrollEnableds = NO;
    }
}

@end
