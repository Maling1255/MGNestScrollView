//
//  MGTableView.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/25.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGTableView.h"

@implementation MGTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    MGTableView *tableView = (MGTableView *)gestureRecognizer.view;
    
    if (tableView.scrollEnabled == YES) {
        
        return NO;
    }

    return YES;
}

@end
