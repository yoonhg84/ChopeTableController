//
//  ChopeTableCellDelegate.h
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 6..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChopeTableCellDelegate <NSObject>

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath;

@optional
- (void)selectedWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)deselectedWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)highlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)unhighlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath;

@end
