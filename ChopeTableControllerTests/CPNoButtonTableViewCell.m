//
// Created by Chope on 2014. 7. 7..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPNoButtonTableViewCell.h"


@implementation CPNoButtonTableViewCell

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath {
    self.label.text = data;
}


@end