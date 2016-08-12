//
//  SelectCell.h
//  TwoFlowerSelection_objc
//
//  Created by zhanght on 16/8/12.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendLabel;


@end
