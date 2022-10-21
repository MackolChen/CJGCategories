//
//  UITextField+History.m
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//

#import "UITextField+CJGHistory.h"
#import <objc/runtime.h>

#define cjg_history_X(view) (view.frame.origin.x)
#define cjg_history_Y(view) (view.frame.origin.y)
#define cjg_history_W(view) (view.frame.size.width)
#define cjg_history_H(view) (view.frame.size.height)

static char kTextFieldIdentifyKey;
static char kTextFieldHistoryviewIdentifyKey;

#define cjg_ANIMATION_DURATION 0.3f
#define cjg_ITEM_HEIGHT 40
#define cjg_CLEAR_BUTTON_HEIGHT 45
#define cjg_MAX_HEIGHT 300


@interface UITextField ()<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) UITableView *cjg_historyTableView;

@end


@implementation UITextField (CJGHistory)

- (NSString*)cjg_identify {
    return objc_getAssociatedObject(self, &kTextFieldIdentifyKey);
}

- (void)setCjg_identify:(NSString *)identify {
    objc_setAssociatedObject(self, &kTextFieldIdentifyKey, identify, OBJC_ASSOCIATION_RETAIN);
}

- (UITableView*)cjg_historyTableView {
    UITableView* table = objc_getAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey);
    
    if (table == nil) {
        table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITextFieldHistoryCell"];
        table.layer.borderColor = [UIColor grayColor].CGColor;
        table.layer.borderWidth = 1;
        table.delegate = self;
        table.dataSource = self;
        objc_setAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    
    return table;
}

- (NSArray*)cjg_loadHistroy {
    if (self.cjg_identify == nil) {
        return nil;
    }

    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+CJGHistory"];
    
    if (dic != nil) {
        return [dic objectForKey:self.cjg_identify];
    }

    return nil;
}

- (void)cjg_synchronize {
    if (self.cjg_identify == nil || [self.text length] == 0) {
        return;
    }
    
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+CJGHistory"];
    NSArray* history = [dic objectForKey:self.cjg_identify];
    
    NSMutableArray* newHistory = [NSMutableArray arrayWithArray:history];
    
    __block BOOL haveSameRecord = false;
    __weak typeof(self) weakSelf = self;
    
    [newHistory enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([(NSString*)obj isEqualToString:weakSelf.text]) {
            *stop = true;
            haveSameRecord = true;
        }
    }];
    
    if (haveSameRecord) {
        return;
    }
    
    [newHistory addObject:self.text];
    
    NSMutableDictionary* dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
    [dic2 setObject:newHistory forKey:self.cjg_identify];
    
    [def setObject:dic2 forKey:@"UITextField+CJGHistory"];
    
    [def synchronize];
}

- (void) cjg_showHistory; {
    NSArray* history = [self cjg_loadHistroy];
    
    if (self.cjg_historyTableView.superview != nil || history == nil || history.count == 0) {
        return;
    }
    
    CGRect frame1 = CGRectMake(cjg_history_X(self), cjg_history_Y(self) + cjg_history_H(self) + 1, cjg_history_W(self), 1);
    CGRect frame2 = CGRectMake(cjg_history_X(self), cjg_history_Y(self) + cjg_history_H(self) + 1, cjg_history_W(self), MIN(cjg_MAX_HEIGHT, cjg_ITEM_HEIGHT * history.count + cjg_CLEAR_BUTTON_HEIGHT));
    
    self.cjg_historyTableView.frame = frame1;
    
    [self.superview addSubview:self.cjg_historyTableView];
    
    [UIView animateWithDuration:cjg_ANIMATION_DURATION animations:^{
        self.cjg_historyTableView.frame = frame2;
    }];
}

- (void) cjg_clearHistoryButtonClick:(UIButton*) button {
    [self cjg_clearHistory];
    [self cjg_hideHistroy];
}

- (void)cjg_hideHistroy; {
    if (self.cjg_historyTableView.superview == nil) {
        return;
    }

    CGRect frame1 = CGRectMake(cjg_history_X(self), cjg_history_Y(self) + cjg_history_H(self) + 1, cjg_history_W(self), 1);
    
    [UIView animateWithDuration:cjg_ANIMATION_DURATION animations:^{
        self.cjg_historyTableView.frame = frame1;
    } completion:^(BOOL finished) {
        [self.cjg_historyTableView removeFromSuperview];
    }];
}

- (void) cjg_clearHistory; {
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    
    [def setObject:nil forKey:@"UITextField+CJGHistory"];
    [def synchronize];
}


#pragma mark tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    return [self cjg_loadHistroy].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITextFieldHistoryCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITextFieldHistoryCell"];
    }
    
    cell.textLabel.text = [self cjg_loadHistroy][indexPath.row];
    
    return cell;
}

#pragma mark tableview delegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section; {
    UIButton* clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(cjg_clearHistoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return clearButton;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    return cjg_ITEM_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; {
    return cjg_CLEAR_BUTTON_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; {
    self.text = [self cjg_loadHistroy][indexPath.row];
    [self cjg_hideHistroy];
}

@end
