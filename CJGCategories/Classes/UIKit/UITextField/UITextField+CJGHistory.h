//
//  UITextField+History.h
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//
//  https://github.com/Jameson-zxm/UITextField-History
//   A category of UITextfiled that can record it's input as history

#import <UIKit/UIKit.h>

@interface UITextField (CJGHistory)

/**
 *  identity of this textfield
 */
@property (retain, nonatomic) NSString *cjg_identify;

/**
 *  load textfiled input history
 *
 *  @param identify identity of this textfield
 *
 *  @return the history of it's input
 */
- (NSArray*)cjg_loadHistroy;

/**
 *  save current input text
 */
- (void)cjg_synchronize;

- (void)cjg_showHistory;
- (void)cjg_hideHistroy;

- (void)cjg_clearHistory;

@end
