//
//  MGAdvancedManagerView.h
//  MGNestScrollView
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGAdvancedManagerView : UIView

@property (nonatomic, copy) void(^pushTestVC)(void);

- (void)popView;

@end

NS_ASSUME_NONNULL_END
