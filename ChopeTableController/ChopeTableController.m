//
//  ChopeTableController.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 6..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeTableController.h"
#import "ChopeTableCellDelegate.h"
#import "ChopeLoadingTableViewCell.h"
#import "ChopeTableCellInfo.h"
#import "ChopeTableInfo.h"


@interface ChopeTableController ()

@property (nonatomic, retain) NSMutableDictionary *tableInfoTable;

@end


@implementation ChopeTableController

- (id)init {
    self = [super init];
    if (self) {
        self.tableInfoTable = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (Class)bottomLoadingCellClass {
    return [UITableViewCell class];
}

+ (NSString *)bottomLoadingCellIdentifier {
    return @"loadingViewCell";
}

- (ChopeTableInfo *)addTableInfo:(UITableView *)tableView
                              paging:(BOOL)paging {
    tableView.dataSource = self;
    tableView.delegate = self;
    
    ChopeTableInfo *info = [[ChopeTableInfo alloc] init];
    info.tableView = tableView;
    info.paging = paging;
    
    self.tableInfoTable[[self keyForTableView:tableView]] = info;
    
    return info;
}

- (ChopeTableInfo *)tableViewInfoWithTableView:(UITableView *)tableView {
    return self.tableInfoTable[[self keyForTableView:tableView]];
}

- (NSString *)keyForTableView:(UITableView *)tableView {
    return [NSString stringWithFormat:@"%lu", (unsigned long)tableView.hash];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];

    if (info.paging && info.hasMore) {
        return info.countOfCell + 1;
    }
    
    return info.countOfCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];
    id<ChopeTableCellDelegate> cellDelegate = nil;
    
    if (info.cellInfoList.count > indexPath.row) {
        cellDelegate = [tableView dequeueReusableCellWithIdentifier:cellInfo.cellIdentifier];
    }
    else {
        cellDelegate = [tableView dequeueReusableCellWithIdentifier:[ChopeTableController bottomLoadingCellIdentifier]];
        
        if (!info.loading && info.loadPageBlock) {
            info.loadPageBlock(info);
        }
    }
    
    [cellDelegate updateData:cellInfo.data indexPath:indexPath];
    
    return (UITableViewCell*) cellDelegate;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];

    if (info.countOfCell > indexPath.row) {
        Class<ChopeTableCellDelegate> delegateClass = cellInfo.cellClass;
        return [delegateClass heightForCell:[info cellInfoAtIndex:indexPath] indexPath:indexPath];
    }

    return [ChopeLoadingTableViewCell heightForCell:info.cellInfoList indexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell respondsToSelector:@selector(selectedWithData:indexPath:)]) {
        ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];
        id<ChopeTableCellDelegate> cellDelegate = (id<ChopeTableCellDelegate>) cell;
        [cellDelegate selectedWithData:cellInfo.data indexPath:indexPath];
    }
    
    if (info.didSelectRow) {
        info.didSelectRow(info, indexPath);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell respondsToSelector:@selector(deselectedWithData:indexPath:)]) {
        id<ChopeTableCellDelegate> cellDelegate = (id<ChopeTableCellDelegate>) cell;
        [cellDelegate deselectedWithData:cellInfo.data indexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell respondsToSelector:@selector(highlightedWithData:indexPath:)]) {
        id<ChopeTableCellDelegate> cellDelegate = (id<ChopeTableCellDelegate>) cell;
        [cellDelegate highlightedWithData:cellInfo.data indexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    ChopeTableInfo *info = [self tableViewInfoWithTableView:tableView];
    ChopeTableCellInfo *cellInfo = [info cellInfoAtIndex:indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell respondsToSelector:@selector(unhighlightedWithData:indexPath:)]) {
        id<ChopeTableCellDelegate> cellDelegate = (id<ChopeTableCellDelegate>) cell;
        [cellDelegate unhighlightedWithData:cellInfo.data indexPath:indexPath];
    }
}


@end
