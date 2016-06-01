//
//  FlowView.h
//  FlowViewDemo
//
//  Created by zhanght on 16/5/5.
//  Copyright © 2016年 HT-SOFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlowViewDelegate;

@interface FlowView : UIView
@property (nonatomic, weak) id<FlowViewDelegate> delegate;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) CGSize pageSize;
@property (nonatomic, assign) CGFloat minimumPageAlpha;
@property (nonatomic, assign) CGFloat minimumPageScale;
- (void)reloadData;
@end


@protocol FlowViewDelegate <NSObject>
@optional
- (void)flowView:(FlowView *)flowView didTapImageAtIndex:(NSInteger)index;
@end
