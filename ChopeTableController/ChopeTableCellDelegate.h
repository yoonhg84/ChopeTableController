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
- (void)selectWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)deselectWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)highlightWithData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)unhighlightWithData:(id)data indexPath:(NSIndexPath *)indexPath;

@end
