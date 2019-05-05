//
//  MGTableViewManager.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGTableViewManager.h"

@interface MGTableViewManager ()


@end
@implementation MGTableViewManager

+ (instancetype)sharedTableView
{
    static MGTableViewManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        _scrollContentView = [[MGScrollContentView alloc] init];
        _scrollContentView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}



@end
