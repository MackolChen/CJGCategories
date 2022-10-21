//
//  UITextView+PlaceHolder.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UITextView (CJGPlaceHolder) <UITextViewDelegate>
@property (nonatomic, strong) UITextView *cjg_placeHolderTextView;
//@property (nonatomic, assign) id <UITextViewDelegate> textViewDelegate;
- (void)cjg_addPlaceHolder:(NSString *)placeHolder;
@end
