//
// Created by Chope on 2014. 6. 3..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChopeTableCellInfo;
@protocol ChopeTableCellDelegate;


@interface ChopeTableInfo : NSObject

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic) BOOL paging;
@property (nonatomic) BOOL loading;
@property (nonatomic) BOOL hasMore;

@property (nonatomic, copy) void (^loadPageBlock)(ChopeTableInfo *cpTableInfo);
@property (nonatomic, copy) void (^didSelectRowBlock)(ChopeTableInfo *cpTableInfo, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didLoadCellBlock)(ChopeTableInfo *cpTableInfo, id<ChopeTableCellDelegate> cellDelegate, NSIndexPath *indexPath);

#pragma mark - Cell
- (void)addCellClass:(Class)cellClass cellIdentifier:(NSString *)cellIdentifier;
- (NSUInteger)countOfCell;
- (ChopeTableCellInfo *)cellInfoAtIndex:(NSIndexPath *)indexPath;

#pragma mark - Data
- (void)addData:(id)data cellIdentifier:(NSString *)cellIdentifier;
- (id)dataAtIndex:(NSIndexPath *)indexPath;
- (void)removeAllData;

@end