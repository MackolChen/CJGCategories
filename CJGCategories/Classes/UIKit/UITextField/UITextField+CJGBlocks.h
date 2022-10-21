//
//  UITextField+Blocks.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITextField (CJGBlocks)
@property (copy, nonatomic) BOOL (^cjg_shouldBegindEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^cjg_shouldEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^cjg_didBeginEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^cjg_didEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^cjg_shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
@property (copy, nonatomic) BOOL (^cjg_shouldReturnBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^cjg_shouldClearBlock)(UITextField *textField);

- (void)setCjg_shouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;
- (void)setCjg_shouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;
- (void)setCjg_didBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;
- (void)setCjg_didEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;
- (void)setCjg_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))shouldChangeCharactersInRangeBlock;
- (void)setCjg_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
- (void)setCjg_shouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;
@end
