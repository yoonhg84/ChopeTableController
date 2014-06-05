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
    
    Class cellClass = [CPSimpleTableViewCell class];
    
    for (NSUInteger i=1; i<=10; i++) {
        [tableViewInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:[NSString stringWithFormat:@"item - %d", i]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
