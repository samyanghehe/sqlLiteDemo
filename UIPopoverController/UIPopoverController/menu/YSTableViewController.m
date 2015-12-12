//
//  YSTableViewController.m
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSTableViewController.h"
#import "YSMenuItem.h"

@interface YSTableViewController ()
@property (nonatomic,strong)NSMutableArray *menuItems;
@end

@implementation YSTableViewController

-(NSMutableArray *)menuItems
{
    if (_menuItems == nil) {
        _menuItems = [NSMutableArray array];
        [_menuItems addObject:[YSMenuItem itemWithIcon:@"movie" title:@"电影"]];
        [_menuItems addObject:[YSMenuItem itemWithIcon:@"music" title:@"音乐"]];
        [_menuItems addObject:[YSMenuItem itemWithIcon:@"video" title:@"视频"]];
    }
    return _menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(130, 44*self.menuItems.count);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = @"menuItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    YSMenuItem *menuItem = self.menuItems[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:menuItem.icon];
    cell.textLabel.text = menuItem.title;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
