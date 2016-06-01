//
//  FlowView.m
//  FlowViewDemo
//
//  Created by zhanght on 16/5/5.
//  Copyright © 2016年 HT-SOFT. All rights reserved.
//

#import "FlowView.h"


@interface FlowView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSLayoutConstraint *lcScrollViewWidth;
@property (nonatomic, strong) NSLayoutConstraint *lcScrollViewHeight;

//左边右边分别多添加两个imageView
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, assign) NSInteger currentImageViewIndex;

@end

@implementation FlowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //initialize
//    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    _pageSize = CGSizeMake((int)(self.bounds.size.width*2/3.0), self.bounds.size.height);
    self.minimumPageAlpha = 1.0;
    self.minimumPageScale = 0.8;
    
    //backgroundImage
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        // 模糊效果
        self.backgroundImageView = [[UIImageView alloc] init];
        self.backgroundImageView.alpha = 0.4;
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.backgroundImageView];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundImageView]|" options:NSLayoutFormatAlignAllLeft metrics:nil views:NSDictionaryOfVariableBindings(_backgroundImageView)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundImageView]|" options:NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(_backgroundImageView)]];
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] init];
        visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
        [visualEffectView setEffect:effect];
        [self.backgroundImageView insertSubview:visualEffectView atIndex:0];
        [self.backgroundImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[visualEffectView]|" options:NSLayoutFormatAlignAllLeft metrics:nil views:NSDictionaryOfVariableBindings(visualEffectView)]];
        [self.backgroundImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[visualEffectView]|" options:NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(visualEffectView)]];
    }

    //scrollView
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lcScrollViewWidth = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.pageSize.width];
    self.lcScrollViewHeight = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.pageSize.height];
    [self.scrollView addConstraint:self.lcScrollViewWidth];
    [self.scrollView addConstraint:self.lcScrollViewHeight];
    NSLayoutConstraint *lcScrollViewCenterX = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *lcScrollViewCenterY = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraint:lcScrollViewCenterX];
    [self addConstraint:lcScrollViewCenterY];
}

- (void)setImages:(NSArray *)images {
    if (images.count < 3) return;
    _images = images;
    
    self.imageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < images.count + 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.layer.cornerRadius = 6;
        imageView.clipsToBounds = YES;
        
        NSInteger index = i-2;
        if (index == -1) index = _images.count-1;
        if (index == -2) index = _images.count-2;
        if (index == _images.count) index = 0;
        if (index == _images.count+1) index = 1;
        UIImage *image = _images[index];
        imageView.image = image;
        [self.imageViews addObject:imageView];
        
        //action 前两个和后两个无效image没有action
        if (i >= 2 && i < images.count+2) {
            imageView.tag = i-2;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
            [imageView addGestureRecognizer:tap];
        }
    }
}

- (void)setPageSize:(CGSize)pageSize {
    _pageSize = pageSize;
    
    self.lcScrollViewWidth.constant = _pageSize.width;
    self.lcScrollViewHeight.constant = _pageSize.height;
    [self layoutIfNeeded];
    
}

- (void)reloadData {
    for (UIView *subView in [self.scrollView subviews]) {
        [subView removeFromSuperview];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.imageViews.count*self.pageSize.width, self.pageSize.height);
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imageView = self.imageViews[i];
        imageView.frame = CGRectMake(i*self.pageSize.width, 8, self.pageSize.width, self.pageSize.height-16);
        CGFloat inset = self.pageSize.width * (1 - self.minimumPageScale) / 2.0 ;
        imageView.frame = UIEdgeInsetsInsetRect(imageView.frame, UIEdgeInsetsMake(inset, inset, inset, inset));
        imageView.alpha = self.minimumPageAlpha;
        [self.scrollView addSubview:imageView];
    }
    [self setFlowViewContentOffset:CGPointMake(2*self.pageSize.width, 0)];
}

- (void)setFlowViewContentOffset:(CGPoint)offset {
    //1.将scrollView设置循环滚动的正确offset
    if (offset.x != self.scrollView.contentOffset.x) {
        self.scrollView.contentOffset = offset;
    }
    //2.计算currentImageViewIndex
    self.currentImageViewIndex = floor(self.scrollView.contentOffset.x / self.pageSize.width);
    //3.根据offset缩放图片
    [self setImageScaleWithContentOffset:offset];
    //4.背景图片
    UIImageView *imageView = self.imageViews[self.currentImageViewIndex];
    self.backgroundImageView.image = imageView.image;
}

- (void)setImageScaleWithContentOffset:(CGPoint)offset {
    if (self.minimumPageAlpha==1.0 && self.minimumPageScale==1.0) return;
    
    for (NSInteger i = 0; i < self.imageViews.count; i++) {
        UIView *imageView = self.imageViews[i];
        CGPoint origin = imageView.frame.origin;
        CGFloat delta = fabs(origin.x - offset.x);
        
        CGRect originFrame = CGRectMake(_pageSize.width * i, 8, _pageSize.width, _pageSize.height-16);
        if (delta < _pageSize.width) {
            imageView.alpha = 1 - (delta / _pageSize.width) * (1 - _minimumPageAlpha);
            
            CGFloat inset = (_pageSize.width * (1 - _minimumPageScale)) * (delta / _pageSize.width)/2.0;
            imageView.frame = UIEdgeInsetsInsetRect(originFrame, UIEdgeInsetsMake(inset, inset, inset, inset));
        } else {
            imageView.alpha = _minimumPageAlpha;
            
            CGFloat inset = _pageSize.width * (1 - _minimumPageScale) / 2.0 ;
            imageView.frame = UIEdgeInsetsInsetRect(originFrame, UIEdgeInsetsMake(inset, inset, inset, inset));
        }
    }
}

- (void)tapImage:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(flowView:didTapImageAtIndex:)]) {
        [self.delegate flowView:self didTapImageAtIndex:tap.view.tag];
    }
}

#pragma mark - scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //计算循环滚动的offset
    CGPoint offset = scrollView.contentOffset;
    //第-1页
    if (scrollView.contentOffset.x <= self.pageSize.width) {
        offset = CGPointMake((self.imageViews.count-3)*self.pageSize.width, 0);
    }
    //第count页
    if (scrollView.contentOffset.x >= (self.imageViews.count-2)*self.pageSize.width) {
        offset = CGPointMake(2*self.pageSize.width, 0);
    }
    //设置计算好的offset
    [self setFlowViewContentOffset:offset];
}

#pragma mark - touch event
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        CGPoint newPoint = CGPointZero;
        newPoint.x = point.x - _scrollView.frame.origin.x + _scrollView.contentOffset.x;
        newPoint.y = point.y - _scrollView.frame.origin.y + _scrollView.contentOffset.y;
        if ([_scrollView pointInside:newPoint withEvent:event]) {
            return [_scrollView hitTest:newPoint withEvent:event];
        }
        return _scrollView;
    }
    return nil;
}


@end
