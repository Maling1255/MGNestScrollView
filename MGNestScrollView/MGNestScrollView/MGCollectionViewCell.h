//
//  MGCollectionViewCell.h
//  MGNestScrollView
//
//  Created by maling on 2019/4/25.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MGTableView;
@interface MGCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) MGTableView *contentTableView;

@end

NS_ASSUME_NONNULL_END
