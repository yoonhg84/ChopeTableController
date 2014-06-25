ChopeTableController
=======

It is not subclass of UITableViewController.

Implemention of UITableViewDataSource, UITableViewDelegate.

##Implements ChopeTableCellDelegate

```objective-c
@interface CPSimpleTableViewCell : UITableViewCell <ChopeTableCellDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation CPSimpleTableViewCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    [self.titleLabel setTextColor:[UIColor whiteColor]];
}

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 30*(indexPath.row+1);
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

##Create ChopeTableController
```objective-c
self.tableController = [[ChopeTableController alloc] init];
```

##Add Table Information

```objective-c
ChopeTableInfo *tableViewInfo = [self.tableController addTableInfo:self.tableView paging:NO];
```
`paging:YES` is not tested.

##Add Cell Information
cell information is about one cell.
- Cell Class
- Cell identifier


```objective-c
Class cellClass = [CPSimpleTableViewCell class];
[tableViewInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"item - A"];
```

## License

ChopeTableController is available under the MIT license. See the LICENSE file for more info.
