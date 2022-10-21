//
//  UIButton+Submitting.m
//  FXCategories
//
//  Created by foxsofter on 15/4/2.
//  Copyright (c) 2015年 foxsofter. All rights reserved.
//

#import "UIButton+CJGSubmitting.h"
#import  <objc/runtime.h>

@interface UIButton ()

@property(nonatomic, strong) UIView *cjg_modalView;
@property(nonatomic, strong) UIActivityIndicatorView *cjg_spinnerView;
@property(nonatomic, strong) UILabel *cjg_spinnerTitleLabel;

@end

@implementation UIButton (CJGSubmitting)

- (void)cjg_beginSubmitting:(NSString *)title {
    [self cjg_endSubmitting];
    
    self.cjg_submitting = @YES;
    self.hidden = YES;
    
    self.cjg_modalView = [[UIView alloc] initWithFrame:self.frame];
    self.cjg_modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.cjg_modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.cjg_modalView.layer.borderWidth = self.layer.borderWidth;
    self.cjg_modalView.layer.borderColor = self.layer.borderColor;
    
    CGRect viewBounds = self.cjg_modalView.bounds;
    self.cjg_spinnerView = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.cjg_spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.cjg_spinnerView.bounds;
    self.cjg_spinnerView.frame = CGRectMake(
                                        15, viewBounds.size.height / 2 - spinnerViewBounds.size.height / 2,
                                        spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    self.cjg_spinnerTitleLabel = [[UILabel alloc] initWithFrame:viewBounds];
    self.cjg_spinnerTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.cjg_spinnerTitleLabel.text = title;
    self.cjg_spinnerTitleLabel.font = self.titleLabel.font;
    self.cjg_spinnerTitleLabel.textColor = self.titleLabel.textColor;
    [self.cjg_modalView addSubview:self.cjg_spinnerView];
    [self.cjg_modalView addSubview:self.cjg_spinnerTitleLabel];
    [self.superview addSubview:self.cjg_modalView];
    [self.cjg_spinnerView startAnimating];
}

- (void)cjg_endSubmitting {
    if (!self.isCJGSubmitting.boolValue) {
        return;
    }
    
    self.cjg_submitting = @NO;
    self.hidden = NO;
    
    [self.cjg_modalView removeFromSuperview];
    self.cjg_modalView = nil;
    self.cjg_spinnerView = nil;
    self.cjg_spinnerTitleLabel = nil;
}

- (NSNumber *)isCJGSubmitting {
    return objc_getAssociatedObject(self, @selector(setCjg_submitting:));
}

- (void)setCjg_submitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setCjg_submitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)cjg_spinnerView {
    return objc_getAssociatedObject(self, @selector(setCjg_spinnerView:));
}

- (void)setCjg_spinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setCjg_spinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cjg_modalView {
    return objc_getAssociatedObject(self, @selector(setCjg_modalView:));

}

- (void)setCjg_modalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setCjg_modalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)cjg_spinnerTitleLabel {
    return objc_getAssociatedObject(self, @selector(setCjg_spinnerTitleLabel:));
}

- (void)setCjg_spinnerTitleLabel:(UILabel *)spinnerTitleLabel {
    objc_setAssociatedObject(self, @selector(setCjg_spinnerTitleLabel:), spinnerTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
