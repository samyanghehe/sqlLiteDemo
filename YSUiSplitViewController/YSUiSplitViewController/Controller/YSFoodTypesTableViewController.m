//
//  YSFoodTypesTableViewController.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSFoodTypesTableViewController.h"
#import "YSFoodTypeModule.h"
#import "MJExtension.h"

@interface YSFoodTypesTableViewController ()

@property (nonatomic,strong)NSArray *foodTypes;

@end


@implementation YSFoodTypesTableViewController

-(NSArray *)foodTypes
{
    if (_foodTypes == nil) {
        //这里是字典转模型的几个方法
        
        //----0,调用模型内部里的字典转模型方法
//            NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"food_types.plist" ofType:nil]];
//            NSMutableArray *arrayM = [NSMutableArray array];
//            for (NSDictionary *dict in dictArray) {
//                YSFoodTypeModule *foodT = [YSFoodTypeModule foodTypeWithDict:dict];
//                [arrayM addObject:foodT];
//            }
//            _foodTypes = arrayM;
        
        //----1,用MJExtension里的字典转模型方法,不用自己再写字典转模型方法.mj_objectWithKeyValues:dict
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"food_types.plist" ofType:nil]];
//        NSMutableArray *arrayM = [NSMutableArray array];
//        for (NSDictionary *dict in dictArray) {
//            YSFoodTypeModule *foodT = [YSFoodTypeModule mj_objectWithKeyValues:dict];
//            [arrayM addObject:foodT];
//        }
//        _foodTypes = arrayM;
        
        //----2,用MJExtension里的字典数组转模型数组方法,不用自己再写字典转模型方法.mj_objectArrayWithKeyValuesArray:dictArray
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"food_types.plist" ofType:nil]];
//        _foodTypes = [YSFoodTypeModule mj_objectArrayWithKeyValuesArray:dictArray];
        
        //----3,用MJExtension里的字典数组转模型数组方法,不用自己再写字典转模型方法.mj_objectArrayWithFile:filePath
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"food_types.plist" ofType:nil];
//        _foodTypes = [YSFoodTypeModule mj_objectArrayWithFile:filePath];
        
        //----4,用MJExtension里的字典数组转模型数组方法,不用自己再写字典转模型方法.mj_objectArrayWithFilename
        _foodTypes = [YSFoodTypeModule mj_objectArrayWithFilename:@"food_types.plist"];
        
    }
    return _foodTypes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"菜系";
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foodTypes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"foodType";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    YSFoodTypeModule *foodType = self.foodTypes[indexPath.row];
    cell.textLabel.text = foodType.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(foodTypesTableViewController:didSelectedFoodType:)]) {
        [self.delegate foodTypesTableViewController:self didSelectedFoodType:self.foodTypes[indexPath.row]];
    }
}

@end
