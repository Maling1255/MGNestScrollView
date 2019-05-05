//
//  MGTableViewManager.h
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGScrollContentView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MGTableViewManager : NSObject

@property (nonatomic, strong) MGScrollContentView *scrollContentView;
@property (nonatomic, assign) BOOL canScroll;
+ (instancetype)sharedTableView;

@end

NS_ASSUME_NONNULL_END
