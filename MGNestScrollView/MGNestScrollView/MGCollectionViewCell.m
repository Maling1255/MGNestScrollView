//
//  MGCollectionViewCell.m
//  MGNestScrollView
//
//  Created by maling on 2019/4/25.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGCollectionViewCell.h"
#import "MGTableView.h"
@interface MGCollectionViewCell ()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation MGCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    _contentTableView = [[MGTableView alloc] initWithFrame:self.bounds];
    _contentTableView.backgroundColor = [UIColor redColor];
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    
    [self addSubview:_contentTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arc4random()%12+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"11"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"11"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了》》》 %ld cell", indexPath.row);
}



@end
