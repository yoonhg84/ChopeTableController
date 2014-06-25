//
//  CPViewController.m
//  ChopeTableControllerTests
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPViewController.h"
#import "ChopeTableController.h"
#import "CPSimpleTableViewCell.h"

#define CELL_IDENTIFIER_LABEL @"simpleCell"

@interface CPViewController ()

@property (nonatomic, strong) ChopeTableController *tableController;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableController = [[ChopeTableController alloc] init];

    ChopeTableInfo *tableViewInfo = [self.tableController addTableInfo:self.tableView paging:NO];
    [tableViewInfo addCellClass:[CPSimpleTableViewCell class] cellIdentifier:CELL_IDENTIFIER_LABEL];

    for (NSUInteger i=1; i<=100; i++) {
        [tableViewInfo addData:[NSString stringWithFormat:@"item - %d", i] cellIdentifier:CELL_IDENTIFIER_LABEL];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
