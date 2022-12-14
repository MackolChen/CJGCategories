//
//  UITextView+PinchZoom.h
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//
//  Based on Aral Balkan snippet.

// https://github.com/cfr/UITextView-PinchZoom
//  Simple pinch-zoom category for UITextView

/*
 UITextView *textView = [[UITextView alloc] initWithFrame:self.view.frame];
 [self.view addSubview:textView];
 textView.zoomEnabled = YES;
 textView.minFontSize = 10;
 textView.maxFontSize = 40;
*/
#import <UIKit/UIKit.h>

@interface UITextView (CJGPinchZoom)

@property (nonatomic) CGFloat cjg_maxFontSize, cjg_minFontSize;

@property (nonatomic, getter = iscjg_zoomEnabled) BOOL cjg_zoomEnabled;

@end
