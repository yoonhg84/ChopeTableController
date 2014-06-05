//
// Created by Chope on 2014. 6. 3..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "ChopeTableInfo.h"
#import "ChopeTableCellInfo.h"
#import "ChopeTableController.h"


@implementation ChopeTableInfo

- (id)init {
    self = [super init];
    if (self) {
        self.hasMore = YES;
        self.cellInfoList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)cellInfoAtIndex:(NSIndexPath *)indexPath {
    if (self.countOfCell <= indexPath.row) {
        return nil;
    }

    ChopeTableCellInfo *cellInfo = self.cellInfoList[(NSUInteger) indexPath.row];
    return cellInfo;
}

- (void)setPaging:(BOOL)paging {
    _paging = paging;
    [self.tableView registerClass:[ChopeTableController bottomLoadingCellClass] forCellReuseIdentifier:[ChopeTableController bottomLoadingCellIdentifier]];
}

- (void)addCellInfo:(ChopeTableCellInfo *)cellInfo {
    [self.cellInfoList addObject:cellInfo];
}

- (void)addCellClass:(Class)cellClass identifier:(NSString *)identifier data:(id)data {
    ChopeTableCellInfo *cellInfo = [[ChopeTableCellInfo alloc] init];
    cellInfo.cellClass = (Class) cellClass;
    cellInfo.cellIdentifier = identifier;
    cellInfo.data = data;
    [self addCellInfo:cellInfo];
}

- (NSUInteger)countOfCell {
    return self.cellInfoList.count;
}

@end