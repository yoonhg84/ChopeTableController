ChopeTableController
=======

It is not subclass of UITableViewController.

Implemention of UITableViewDataSource, UITableViewDelegate.

## Installation with CocoaPods
```
pod "ChopeTableController", '~>0.4'
```

## Implements ChopeTableCellDelegate
```objective-c
@interface CPRightButtonTableViewCell : UITableViewCell <ChopeTableCellDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation CPRightButtonTableViewCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    [self.titleLabel setTextColor:[UIColor whiteColor]];
}

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 40 + (indexPath.row+1);
}

- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self.titleLabel setText:data];
    [self setNormalBackgroundColor:indexPath];
}

- (void)setNormalBackgroundColor:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        [self setBackgroundColor:[UIColor darkGrayColor]];
    }
    else {
        [self setBackgroundColor:[UIColor purpleColor]];
    }
}

- (void)selectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor blueColor]];
}

- (void)deselectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}

- (void)highlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor redColor]];
}

- (void)unhighlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}

@end
```

## Create ChopeTableController
```objective-c
self.tableController = [[ChopeTableController alloc] init];
```

## Set Table Information

```objective-c
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
```
`paging:YES` is not tested.

## Add Data
cell information is about one cell.

```objective-c
- (void)addData:(id)data cellIdentifier:(NSString *)cellIdentifier;
- (void)addDataFromArray:(NSArray *)array cellIdentifier:(NSString *)identifier;
- (void)insertData:(id)data cellIdentifier:(NSString *)cellIdentifier atIndex:(NSUInteger)index;
- (void)insertDataFromArray:(NSArray *)array cellIdentifier:(NSString *)cellIdentifier atIndex:(NSUInteger)index;
```


## Remove Data
```objective-c
[tableViewInfo removeAllData];
```

## Screenshot
![](Screenshot_1.png)

![](Screenshot_2.png)

## License

ChopeTableController is available under the MIT license. See the LICENSE file for more info.
