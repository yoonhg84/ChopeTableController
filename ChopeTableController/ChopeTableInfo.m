//
// Created by Chope on 2014. 6. 3..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "ChopeTableInfo.h"
#import "ChopeTableCellInfo.h"
#import "ChopeTableController.h"

#pragma mark - ChopeCell
@interface ChopeCell : NSObject

@property (nonatomic, strong) ChopeTableCellInfo *cellInfo;
@property (nonatomic, strong) id data;

@end

@implementation ChopeCell

@end


#pragma mark - ChopeTableInfo
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

- (void)addCellClass:(Class)cellClass cellIdentifier:(NSString *)cellIdentifier {
    ChopeTableCellInfo *cellInfo = [[ChopeTableCellInfo alloc] init];
    cellInfo.cellClass = cellClass;
    cellInfo.cellIdentifier = cellIdentifier;

    [self.cellInfoDic setObject:cellInfo forKey:cellInfo.cellIdentifier];
}

- (ChopeTableCellInfo *)cellInfoAtIndex:(NSIndexPath *)indexPath {
    if (self.countOfCell <= indexPath.row) {
        return nil;
    }

    ChopeCell *cell = self.cellDataArray[(NSUInteger) indexPath.row];
    return cell.cellInfo;
}

- (void)setCellIdentifier:(NSString *)cellIdentifier atIndex:(NSIndexPath *)indexPath {
    ChopeTableCellInfo *cellInfo = self.cellInfoDic[cellIdentifier];
    assert(cellInfo != nil);

    ChopeCell *cell = self.cellDataArray[(NSUInteger) indexPath.row];
    assert(cell);

    cell.cellInfo = cellInfo;
}

- (NSUInteger)countOfCell {
    return self.cellDataArray.count;
}

- (void)addData:(id)data cellIdentifier:(NSString *)cellIdentifier {
    ChopeTableCellInfo *cellInfo = self.cellInfoDic[cellIdentifier];
    assert(cellInfo != nil);

    ChopeCell *cell = [[ChopeCell alloc] init];
    cell.cellInfo = cellInfo;
    cell.data = data;

    [self.cellDataArray addObject:cell];
}

- (void)addDataFromArray:(NSArray *)array cellIdentifier:(NSString *)identifier {
    for (id data in array) {
        [self addData:data cellIdentifier:identifier];
    }
}

- (void)insertData:(id)data cellIdentifier:(NSString *)cellIdentifier atIndex:(NSUInteger)index {
    ChopeTableCellInfo *cellInfo = self.cellInfoDic[cellIdentifier];
    assert(cellInfo != nil);

    ChopeCell *cell = [[ChopeCell alloc] init];
    cell.cellInfo = cellInfo;
    cell.data = data;

    [self.cellDataArray insertObject:cell atIndex:index];
}

- (void)insertDataFromArray:(NSArray *)array cellIdentifier:(NSString *)cellIdentifier atIndex:(NSUInteger)index {
    NSEnumerator *reversEnumerator = [array reverseObjectEnumerator];
    id object = nil;

    while ((object = reversEnumerator.nextObject) != nil) {
        [self insertData:object cellIdentifier:cellIdentifier atIndex:index];
    }
}

- (id)dataAtIndex:(NSIndexPath *)indexPath {
    if (self.countOfCell <= indexPath.row) {
        return nil;
    }

    ChopeCell *cell = self.cellDataArray[(NSUInteger) indexPath.row];
    return cell.data;
}

- (NSInteger)indexOfData:(id)data {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"data=%@", data];
    NSArray *filteredArray = [self.cellDataArray filteredArrayUsingPredicate:predicate];

    if (!filteredArray || filteredArray.count == 0) {
        return -1;
    }

    ChopeCell *cell = filteredArray[0];
    return [self.cellDataArray indexOfObject:cell];
}

- (void)removeAllData {
    [self.cellDataArray removeAllObjects];
}

@end