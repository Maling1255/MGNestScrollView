//
//  MGTestViewController.h
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGTestViewController : UIViewController

@property (nonatomic, copy) void(^deallocVC)(void);

@end

NS_ASSUME_NONNULL_END
