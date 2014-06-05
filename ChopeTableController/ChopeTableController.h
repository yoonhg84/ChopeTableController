//
//  ChopeTableController.h
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 6..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChopeTableController.h"
#import "ChopeTableInfo.h"

@interface ChopeTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

+ (Class)bottomLoadingCellClass;
+ (NSString *)bottomLoadingCellIdentifier;

- (ChopeTableInfo *)addTableInfo:(UITableView*)tableView
                          paging:(BOOL)paging;
- (ChopeTableInfo *)tableViewInfoWithTableView:(UITableView*)tableView;

@end
