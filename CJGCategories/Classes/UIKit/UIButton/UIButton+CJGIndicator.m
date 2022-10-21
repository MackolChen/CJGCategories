//
//  UIButton+Indicator.m
//  UIButton Indicator
//
//  Copyright (c) 2015 Jeremiah Poisson
//

#import "UIButton+CJGIndicator.h"
#import <objc/runtime.h>

// Associative reference keys.
static NSString *const cjg_IndicatorViewKey = @"indicatorView";
static NSString *const cjg_ButtonTextObjectKey = @"buttonTextObject";

@implementation UIButton (CJGIndicator)

- (void)cjg_showIndicator {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [indicator startAnimating];
    
    NSString *currentButtonText = self.titleLabel.text;
    
    objc_setAssociatedObject(self, &cjg_ButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &cjg_IndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:indicator];
    
    
}

- (void)cjg_hideIndicator {
    
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &cjg_ButtonTextObjectKey);
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &cjg_IndicatorViewKey);
    
    [indicator removeFromSuperview];
    [self setTitle:currentButtonText forState:UIControlStateNormal];
    self.enabled = YES;
    
}

@end
