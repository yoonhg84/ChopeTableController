//
//  ChopeLoadingTableViewCell.m
//  MukBang
//
//  Created by Chope on 2014. 5. 10..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeLoadingTableViewCell.h"

@implementation ChopeLoadingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configure];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    NSLog(@"selectedWithAnimation : %d", selected);
}

- (void)setSelected:(BOOL)selected {
    NSLog(@"selected : %d", selected);
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    NSLog(@"highlightedWithAnimation : %d", highlighted);
}

- (void)setHighlighted:(BOOL)highlighted {
    NSLog(@"highlighted : %d", highlighted);
}

- (void)configure {
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.indicatorView setAutoresizingMask:UIViewAutoresizingNone];
    [self.indicatorView setCenter:CGPointMake((CGFloat) (self.frame.size.width/2.0), 30)];
    
    [self addSubview:self.indicatorView];
}


#pragma mark - ChopeTableViewCellDelegate
+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self.indicatorView startAnimating];
}

@end
