//
//  UISearchBar+CJGBlocks.h
//  UISearchBarBlocks
//
//  Created by Håkon Bogen on 20.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (CJGBlocks)

@property (copy, nonatomic) BOOL (^cjg_completionShouldBeginEditingBlock)(UISearchBar *searchbar);
@property (copy, nonatomic) void (^cjg_completionTextDidBeginEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) BOOL (^cjg_completionShouldEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionTextDidEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionTextDidChangeBlock)(UISearchBar *searchBar, NSString *searchText);
@property (copy, nonatomic) BOOL (^cjg_completionShouldChangeTextInRangeBlock)(UISearchBar *searchBar, NSRange range, NSString *replacementText);
@property (copy, nonatomic) void (^cjg_completionSearchButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionBookmarkButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionCancelButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionResultsListButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^cjg_completionSelectedScopeButtonIndexDidChangeBlock)(UISearchBar *searchBar, NSInteger selectedScope);

- (void)setCjg_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldBeginEditingBlock;
- (void)setCjg_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidBeginEditingBlock;
- (void)setCjg_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldEndEditingBlock;
- (void)setCjg_completionTextDidEndEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidEndEditingBlock;
- (void)setCjg_completionTextDidChangeBlock:(void (^)(UISearchBar *searchBar, NSString *text))searchBarTextDidChangeBlock;
- (void)setCjg_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *searchBar, NSRange range, NSString *text))searchBarShouldChangeTextInRangeBlock;
- (void)setCjg_completionSearchButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarSearchButtonClickedBlock;
- (void)setCjg_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarBookmarkButtonClickedBlock;
- (void)setCjg_completionCancelButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarCancelButtonClickedBlock;
- (void)setCjg_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarResultsListButtonClickedBlock;
- (void)setCjg_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *searchBar, NSInteger index))searchBarSelectedScopeButtonIndexDidChangeBlock;

@end
