//
//  SelectVC.m
//  TwoFlowerSelection_objc
//
//  Created by zhanght on 16/7/22.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import "SelectVC.h"
#import "SelectCell.h"
#import "FlowView.h"

@interface SelectVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FlowView *flowView;

@end

@implementation SelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"精选";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectCell" bundle:nil] forCellReuseIdentifier:@"identifier"];
    self.flowView = [[FlowView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i <= 7; i++) {
        NSString *name = [NSString stringWithFormat:@"%d", i];
        UIImage *image = [UIImage imageNamed:name];
        [array addObject:image];
    }
    self.flowView.images = array;
    [self.flowView reloadData];
    self.tableView.tableHeaderView = self.flowView;
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
