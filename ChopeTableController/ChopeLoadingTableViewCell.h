//
//  ChopeLoadingTableViewCell.h
//  MukBang
//
//  Created by Chope on 2014. 5. 10..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChopeTableCellDelegate.h"

@interface ChopeLoadingTableViewCell : UITableViewCell <ChopeTableCellDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end
