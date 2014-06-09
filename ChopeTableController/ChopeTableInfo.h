//
// Created by Chope on 2014. 6. 3..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChopeTableCellInfo;
@protocol ChopeTableCellDelegate;


@interface ChopeTableInfo : NSObject

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *cellInfoList;
@property (nonatomic) BOOL paging;
@property (nonatomic) BOOL loading;
@property (nonatomic) BOOL hasMore;

@property (nonatomic, copy) void (^loadPageBlock)(ChopeTableInfo *tableInfo);
@property (nonatomic, copy) void (^didSelectRowBlock)(ChopeTableInfo *tableInfo, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didLoadCellBlock)(ChopeTableInfo *tableInfo, id<ChopeTableCellDelegate> cellDelegate, NSIndexPath *indexPath);

- (id)cellInfoAtIndex:(NSIndexPath *)indexPath;
- (void)addCellInfo:(ChopeTableCellInfo *)cellInfo;
- (void)addCellClass:(Class)cellClass identifier:(NSString *)identifier data:(id)data;
- (NSUInteger)countOfCell;

@end