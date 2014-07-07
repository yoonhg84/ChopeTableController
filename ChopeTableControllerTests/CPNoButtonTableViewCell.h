//
// Created by Chope on 2014. 7. 7..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChopeTableCellDelegate.h"


@interface CPNoButtonTableViewCell : UITableViewCell <ChopeTableCellDelegate>

@property (nonatomic, weak) IBOutlet UILabel *label;

@end