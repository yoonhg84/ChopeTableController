//
//  CPRightButtonTableViewCell.h
//  ChopeTableControllerTests
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChopeTableCellDelegate.h"

@interface CPRightButtonTableViewCell : UITableViewCell <ChopeTableCellDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *button;

@end
