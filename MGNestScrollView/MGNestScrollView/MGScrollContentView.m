//
//  MGScrollContentView.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/25.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGScrollContentView.h"
#import "UIView+frame.h"
#import "MGCollectionViewCell.h"
#import "MGTableView.h"
static NSString * const reuseIdentifier = @"scrollCell";

@interface MGScrollContentView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *displayCollectionView;

@property (nonatomic, strong) MGCollectionViewCell *cell;

@end
@implementation MGScrollContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UIView *topScrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MGScreenWidth, 50)];
    topScrollView.backgroundColor = [UIColor purpleColor];
    [self addSubview:topScrollView];
    
    [self addSubview:self.displayCollectionView];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MGCollectionViewCell *cell = (MGCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    self.cell = cell;
    
     cell.contentTableView.scrollEnabled = _scrollEnableds;
    cell.backgroundColor = MGRandomColor;
    
    return cell;
}


- (void)setScrollEnableds:(BOOL)scrollEnableds
{
    _scrollEnableds = scrollEnableds;
    
    [self.displayCollectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.displayCollectionView.width, self.displayCollectionView.height);
}

- (UICollectionView *)displayCollectionView
{
    if (!_displayCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = 0.;
        layout.minimumInteritemSpacing = 0.;
        
        _displayCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, MGScreenWidth, MGScreenHeight - 64)
                                                    collectionViewLayout:layout];
        _displayCollectionView.backgroundColor = [UIColor clearColor];
        _displayCollectionView.bounces = YES;
        _displayCollectionView.pagingEnabled = YES;
        _displayCollectionView.showsHorizontalScrollIndicator = NO;
        _displayCollectionView.showsVerticalScrollIndicator = NO;
        [_displayCollectionView registerClass:[MGCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        _displayCollectionView.delegate = (id)self;
        _displayCollectionView.dataSource = (id)self;
    }
    return _displayCollectionView;
}






@end
