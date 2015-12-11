//
//  YSTableViewController.m
//  sqlLiteDemo2
//
//  Created by ys on 15/12/11.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSTableViewController.h"
#import "YSStudentTool.h"
#import "YSStudent.h"

@interface YSTableViewController ()<UISearchBarDelegate>
@property (nonatomic,strong)NSArray *students;

@end

@implementation YSTableViewController

-(NSArray *)students
{
    if (_students == nil) {
        _students = [YSStudentTool students];
    }
    return _students;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
    

}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

//根据输入搜索符合条件的数据
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    _students = [YSStudentTool studentsWithCondition:searchText];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.students.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"student";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    YSStudent *stu = self.students[indexPath.row];
    cell.textLabel.text = stu.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",stu.age];
    return cell;
}

@end
