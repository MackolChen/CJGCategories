//
//  UISearchBar+CJGBlocks.m
//  UISearchBarBlocks
//
//  Created by Håkon Bogen on 20.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "UISearchBar+CJGBlocks.h"
#import <objc/runtime.h>

/* Only for convenience and readabilty in delegate methods */
typedef BOOL (^cjg_UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^cjg_UISearchBarVoidBlock) (UISearchBar *searchBar);
typedef void (^cjg_UISearchBarSearchTextBlock) (UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^cjg_UISearchBarInRangeReplacementTextBlock) (UISearchBar *searchBar,NSRange range,NSString *text);
typedef void (^cjg_UISearchBarScopeIndexBlock)(UISearchBar *searchBar, NSInteger selectedScope);

@implementation UISearchBar (JKBlocks)


static const void *cjg_UISearchBarDelegateKey                                = &cjg_UISearchBarDelegateKey;
static const void *cjg_UISearchBarShouldBeginEditingKey                      = &cjg_UISearchBarShouldBeginEditingKey;
static const void *cjg_UISearchBarTextDidBeginEditingKey                     = &cjg_UISearchBarTextDidBeginEditingKey;
static const void *cjg_UISearchBarShouldEndEditingKey                        = &cjg_UISearchBarShouldEndEditingKey;
static const void *cjg_UISearchBarTextDidEndEditingKey                       = &cjg_UISearchBarTextDidEndEditingKey;
static const void *cjg_UISearchBarTextDidChangeKey                           = &cjg_UISearchBarTextDidChangeKey;
static const void *cjg_UISearchBarShouldChangeTextInRangeKey                 = &cjg_UISearchBarShouldChangeTextInRangeKey;
static const void *cjg_UISearchBarSearchButtonClickedKey                                = &cjg_UISearchBarSearchButtonClickedKey;
static const void *cjg_UISearchBarBookmarkButtonClickedKey                                = &cjg_UISearchBarBookmarkButtonClickedKey;
static const void *cjg_UISearchBarCancelButtonClickedKey                                = &cjg_UISearchBarCancelButtonClickedKey;
static const void *cjg_UISearchBarResultsListButtonClickedKey                                = &cjg_UISearchBarResultsListButtonClickedKey;
static const void *cjg_UISearchBarSelectedScopeButtonIndexDidChangeKey                                = &cjg_UISearchBarSelectedScopeButtonIndexDidChangeKey;




#pragma mark UISearchBar delegate Methods
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
{
    cjg_UISearchBarReturnBlock block = searchBar.cjg_completionShouldBeginEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    cjg_UISearchBarVoidBlock block = searchBar.cjg_completionTextDidBeginEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]){
        [delegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    cjg_UISearchBarReturnBlock block = searchBar.cjg_completionShouldEndEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
   cjg_UISearchBarVoidBlock block = searchBar.cjg_completionTextDidEndEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [delegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    cjg_UISearchBarSearchTextBlock block = searchBar.cjg_completionTextDidChangeBlock;
    if (block) {
        block(searchBar,searchText);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [delegate searchBar:searchBar textDidChange:searchText];
    }
}
// called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    cjg_UISearchBarInRangeReplacementTextBlock block = searchBar.cjg_completionShouldChangeTextInRangeBlock;
    if (block) {
        return block(searchBar,range,text);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]){
        return [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    cjg_UISearchBarVoidBlock block = searchBar.cjg_completionSearchButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    cjg_UISearchBarVoidBlock block = searchBar.cjg_completionBookmarkButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]){
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    cjg_UISearchBarVoidBlock block = searchBar.cjg_completionCancelButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]){
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    cjg_UISearchBarVoidBlock block = searchBar.cjg_completionResultsListButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]){
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    cjg_UISearchBarScopeIndexBlock block = searchBar.cjg_completionSelectedScopeButtonIndexDidChangeBlock;
    if (block) {
        block(searchBar,selectedScope);
    }
    id delegate = objc_getAssociatedObject(self, cjg_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]){
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}


#pragma mark Block setting/getting methods
- (BOOL (^)(UISearchBar *))cjg_completionShouldBeginEditingBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarShouldBeginEditingKey);
}

- (void)setCjg_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarShouldBeginEditingKey, searchBarShouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionTextDidBeginEditingBlock
{
    return objc_getAssociatedObject(self,cjg_UISearchBarTextDidBeginEditingKey);
}

- (void)setCjg_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *))searchBarTextDidBeginEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarTextDidBeginEditingKey, searchBarTextDidBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))cjg_completionShouldEndEditingBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarShouldEndEditingKey);
}

- (void)setCjg_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldEndEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarShouldEndEditingKey, searchBarShouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionTextDidEndEditingBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarTextDidEndEditingKey);
}

- (void)setCjg_completionTextDidEndEditingBlock:(void (^)(UISearchBar *))searchBarTextDidEndEditingBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarTextDidEndEditingKey, searchBarTextDidEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSString *))cjg_completionTextDidChangeBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarTextDidChangeKey);
}

- (void)setCjg_completionTextDidChangeBlock:(void (^)(UISearchBar *, NSString *))searchBarTextDidChangeBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarTextDidChangeKey, searchBarTextDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *, NSRange, NSString *))cjg_completionShouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarShouldChangeTextInRangeKey);
}

- (void)setCjg_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRangeBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarShouldChangeTextInRangeKey, searchBarShouldChangeTextInRangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionSearchButtonClickedBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarSearchButtonClickedKey);
}

- (void)setCjg_completionSearchButtonClickedBlock:(void (^)(UISearchBar *))searchBarSearchButtonClickedBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarSearchButtonClickedKey, searchBarSearchButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionBookmarkButtonClickedBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarBookmarkButtonClickedKey);
}

- (void)setCjg_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *))searchBarBookmarkButtonClickedBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarBookmarkButtonClickedKey, searchBarBookmarkButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionCancelButtonClickedBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarCancelButtonClickedKey);
}

- (void)setCjg_completionCancelButtonClickedBlock:(void (^)(UISearchBar *))searchBarCancelButtonClickedBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarCancelButtonClickedKey, searchBarCancelButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))cjg_completionResultsListButtonClickedBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarResultsListButtonClickedKey);
}

- (void)setCjg_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *))searchBarResultsListButtonClickedBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarResultsListButtonClickedKey, searchBarResultsListButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSInteger))cjg_completionSelectedScopeButtonIndexDidChangeBlock
{
    return objc_getAssociatedObject(self, cjg_UISearchBarSelectedScopeButtonIndexDidChangeKey);
}

- (void)setCjg_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *, NSInteger))searchBarSelectedScopeButtonIndexDidChangeBlock
{
    [self cjg_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, cjg_UISearchBarSelectedScopeButtonIndexDidChangeKey, searchBarSelectedScopeButtonIndexDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void)cjg_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)self) {
        objc_setAssociatedObject(self, cjg_UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UISearchBarDelegate>)self;
    }
}

@end
