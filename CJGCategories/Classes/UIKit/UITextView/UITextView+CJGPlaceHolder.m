//
//  UITextView+PlaceHolder.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UITextView+CJGPlaceHolder.h"
static const char *cjg_placeHolderTextView = "cjg_placeHolderTextView";
@implementation UITextView (CJGPlaceHolder)
- (UITextView *)cjg_placeHolderTextView {
    return objc_getAssociatedObject(self, cjg_placeHolderTextView);
}
- (void)setCjg_placeHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, cjg_placeHolderTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)cjg_addPlaceHolder:(NSString *)placeHolder {
    if (![self cjg_placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setCjg_placeHolderTextView:textView];
    }
}
# pragma mark -
# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.cjg_placeHolderTextView.hidden = YES;
    // if (self.textViewDelegate) {
    //
    // }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.cjg_placeHolderTextView.hidden = NO;
    }
}

@end
