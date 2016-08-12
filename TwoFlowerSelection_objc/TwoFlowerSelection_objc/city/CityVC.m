//
//  CityVC.m
//  TwoFlowerSelection_objc
//
//  Created by zhanght on 16/7/22.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import "CityVC.h"
#import "CityCell.h"

@interface CityVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil] forCellReuseIdentifier:@"cityCell"];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 275;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
