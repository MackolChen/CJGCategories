//
// UITextField+Blocks.m
// UITextFieldBlocks
//
// Created by Håkon Bogen on 19.10.13.
// Copyright (c) 2013 Håkon Bogen. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#import "UITextField+CJGBlocks.h"
#import <objc/runtime.h>
typedef BOOL (^CJGUITextFieldReturnBlock) (UITextField *textField);
typedef void (^CJGUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^CJGUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (CJGBlocks)
static const void *CJGUITextFieldDelegateKey = &CJGUITextFieldDelegateKey;
static const void *CJGUITextFieldShouldBeginEditingKey = &CJGUITextFieldShouldBeginEditingKey;
static const void *CJGUITextFieldShouldEndEditingKey = &CJGUITextFieldShouldEndEditingKey;
static const void *CJGUITextFieldDidBeginEditingKey = &CJGUITextFieldDidBeginEditingKey;
static const void *CJGUITextFieldDidEndEditingKey = &CJGUITextFieldDidEndEditingKey;
static const void *CJGUITextFieldShouldChangeCharactersInRangeKey = &CJGUITextFieldShouldChangeCharactersInRangeKey;
static const void *CJGUITextFieldShouldClearKey = &CJGUITextFieldShouldClearKey;
static const void *CJGUITextFieldShouldReturnKey = &CJGUITextFieldShouldReturnKey;
#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CJGUITextFieldReturnBlock block = textField.cjg_shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    CJGUITextFieldReturnBlock block = textField.cjg_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
   CJGUITextFieldVoidBlock block = textField.cjg_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    CJGUITextFieldVoidBlock block = textField.cjg_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    CJGUITextFieldCharacterChangeBlock block = textField.cjg_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    CJGUITextFieldReturnBlock block = textField.cjg_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    CJGUITextFieldReturnBlock block = textField.cjg_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, CJGUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))cjg_shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldShouldBeginEditingKey);
}
- (void)setCjg_shouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))cjg_shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldShouldEndEditingKey);
}
- (void)setCjg_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))cjg_didBeginEditingBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldDidBeginEditingKey);
}
- (void)setCjg_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))cjg_didEndEditingBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldDidEndEditingKey);
}
- (void)setCjg_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))cjg_shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setCjg_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))cjg_shouldReturnBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldShouldReturnKey);
}
- (void)setCjg_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))cjg_shouldClearBlock
{
    return objc_getAssociatedObject(self, CJGUITextFieldShouldClearKey);
}
- (void)setCjg_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, CJGUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)cjg_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, CJGUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end
