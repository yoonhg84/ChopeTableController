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

- (void)addCellClass:(Class)cellClass cellIdentifier:(NSString *)cellIdentifier;
- (void)addData:(id)data cellIdentifier:(NSString *)cellIdentifier;
- (NSUInteger)countOfCell;


#pragma mark - CellData
- (ChopeTableCellInfo *)cellInfoAtIndex:(NSIndexPath *)indexPath;
- (id)dataAtIndex:(NSIndexPath *)indexPath;

@end