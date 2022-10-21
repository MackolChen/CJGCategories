/***************************************************************************
 
UIView+Toast.h
Toast

Copyright (c) 2014 Charles Scalesse.
 
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
***************************************************************************/

#import <UIKit/UIKit.h>

extern NSString * const CJGToastPositionTop;
extern NSString * const CJGToastPositionCenter;
extern NSString * const CJGToastPositionBottom;

@interface UIView (CJGToast)

// each makeToast method creates a view and displays it as toast
- (void)cjg_makeToast:(NSString *)message;
- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position;
- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image;
- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title;
- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image;

// displays toast with an activity spinner
- (void)cjg_makeToastActivity;
- (void)cjg_makeToastActivity:(id)position;
- (void)cjg_hideToastActivity;

// the showToast methods display any view as toast
- (void)cjg_showToast:(UIView *)toast;
- (void)cjg_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point;
- (void)cjg_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point
      tapCallback:(void(^)(void))tapCallback;

@end
