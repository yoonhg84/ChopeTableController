//
//  CPViewController.m
//  ChopeTableControllerTests
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPViewController.h"
#import "ChopeTableController.h"
#import "CPRightButtonTableViewCell.h"
#import "CPNoButtonTableViewCell.h"
#import "ChopeTableCellInfo.h"

#define CELL_IDENTIFIER_RIGHT_BUTTON    @"simpleCell"
#define CELL_IDENTIFIER_NO_BUTTON       @"NoButton"


@interface CPViewController ()

@property (nonatomic, strong) ChopeTableController *tableController;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableController = [[ChopeTableController alloc] init];

    ChopeTableInfo *tableViewInfo = [self.tableController addTableView:self.tableView paging:NO];
    [tableViewInfo addCellClass:[CPRightButtonTableViewCell class] cellIdentifier:CELL_IDENTIFIER_RIGHT_BUTTON];
    [tableViewInfo addCellClass:[CPNoButtonTableViewCell class] cellIdentifier:CELL_IDENTIFIER_NO_BUTTON];
    [tableViewInfo setDidLoadCellBlock:^(ChopeTableInfo *tableInfo, id <ChopeTableCellDelegate> cellDelegate, NSIndexPath *indexPath) {
        CPRightButtonTableViewCell *cell = (CPRightButtonTableViewCell *) cellDelegate;
        ChopeTableCellInfo *cellInfo = [tableInfo cellInfoAtIndex:indexPath];

        if ([cellInfo.cellIdentifier isEqualToString:CELL_IDENTIFIER_RIGHT_BUTTON]) {
            cell.button.tag = indexPath.row;
            [cell.button addTarget:self action:@selector(touchTestButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }];
    [tableViewInfo setDidSelectRowBlock:^(ChopeTableInfo *cpTableInfo, NSIndexPath *indexPath) {
        NSLog(@"selected cell : %d", indexPath.row);
    }];

    for (NSUInteger i=1; i<=30; i++) {
        [tableViewInfo addData:[NSString stringWithFormat:@"item - %d", i] cellIdentifier:CELL_IDENTIFIER_RIGHT_BUTTON];
    }

    [tableViewInfo addDataFromArray:@[@"A",@"B",@"C"] cellIdentifier:CELL_IDENTIFIER_RIGHT_BUTTON];
    [tableViewInfo insertData:@"chope" cellIdentifier:CELL_IDENTIFIER_RIGHT_BUTTON atIndex:30];
    [tableViewInfo insertDataFromArray:@[@"Chope",@"yoonhg2002@gmail.com",@"http://blog.chopestory.net"] cellIdentifier:CELL_IDENTIFIER_RIGHT_BUTTON atIndex:0];

    [tableViewInfo setCellIdentifier:CELL_IDENTIFIER_NO_BUTTON atIndex:[NSIndexPath indexPathForRow:[tableViewInfo indexOfData:@"chope"] inSection:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchTestButton:(UIButton *)button {
    NSLog(@"touched button : %d", button.tag);
}

@end
