//
// Created by Chope on 2014. 6. 3..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "ChopeTableInfo.h"
#import "ChopeTableCellInfo.h"
#import "ChopeTableController.h"

@interface ChopeTableInfo ()

@property (nonatomic, strong) NSMutableArray *cellDataArray;
@property (nonatomic, strong) NSMutableDictionary *cellInfoDic;

@end


@implementation ChopeTableInfo

- (id)init {
    self = [super init];
    if (self) {
        self.hasMore = YES;
        self.cellDataArray = [[NSMutableArray alloc] init];
        self.cellInfoDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setPaging:(BOOL)paging {
    _paging = paging;
    [self.tableView registerClass:[ChopeTableController bottomLoadingCellClass] forCellReuseIdentifier:[ChopeTableController bottomLoadingCellIdentifier]];
}


#pragma mark - Cell
- (void)addCellClass:(Class)cellClass cellIdentifier:(NSString *)cellIdentifier {
    ChopeTableCellInfo *cellInfo = [[ChopeTableCellInfo alloc] init];
    cellInfo.cellClass = cellClass;
    cellInfo.cellIdentifier = cellIdentifier;

    [self.cellInfoDic setObject:cellInfo forKey:cellInfo.cellIdentifier];
}

- (id)cellDataWithCellInfo:(ChopeTableCellInfo *)cellInfo data:(id)data {
    return (id) @[cellInfo, data];
}

- (ChopeTableCellInfo *)cellInfoAtIndex:(NSIndexPath *)indexPath {
    if (self.countOfCell <= indexPath.row) {
        return nil;
    }

    NSArray *cellData = self.cellDataArray[(NSUInteger) indexPath.row];
    return cellData[0];
}

- (NSUInteger)countOfCell {
    return self.cellDataArray.count;
}


#pragma mark - Data
- (void)addData:(id)data cellIdentifier:(NSString *)cellIdentifier {
    ChopeTableCellInfo *cellInfo = self.cellInfoDic[cellIdentifier];
    assert(cellInfo != nil);

    [self.cellDataArray addObject:[self cellDataWithCellInfo:cellInfo data:data]];
}

- (id)dataAtIndex:(NSIndexPath *)indexPath {
    if (self.countOfCell <= indexPath.row) {
        return nil;
    }

    NSArray *cellData = self.cellDataArray[(NSUInteger) indexPath.row];
    return cellData[1];
}

- (void)removeAllData {
    [self.cellDataArray removeAllObjects];
}

@end