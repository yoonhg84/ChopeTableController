//
//  CPSimpleTableViewCell.m
//  ChopeTableControllerTests
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPSimpleTableViewCell.h"

@implementation CPSimpleTableViewCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    [self.titleLabel setTextColor:[UIColor whiteColor]];
}

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 30*(indexPath.row+1);
}

- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self.titleLabel setText:data];
    [self setNormalBackgroundColor:indexPath];
}

- (void)setNormalBackgroundColor:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        [self setBackgroundColor:[UIColor darkGrayColor]];
    }
    else {
        [self setBackgroundColor:[UIColor purpleColor]];
    }
}

- (void)selectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor blueColor]];
}

- (void)deselectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}

- (void)highlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor redColor]];
}

- (void)unhighlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}

@end
