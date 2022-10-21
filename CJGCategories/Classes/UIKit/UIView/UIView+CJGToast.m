//
//  UIView+Toast.m
//  Toast
//
//  Copyright 2014 Charles Scalesse.
//


#import "UIView+CJGToast.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

/*
 *  CONFIGURE THESE VALUES TO ADJUST LOOK & FEEL,
 *  DISPLAY DURATION, ETC.
 */

// general appearance
static const CGFloat CJGToastMaxWidth            = 0.8;      // 80% of parent view width
static const CGFloat CJGToastMaxHeight           = 0.8;      // 80% of parent view height
static const CGFloat CJGToastHorizontalPadding   = 10.0;
static const CGFloat CJGToastVerticalPadding     = 10.0;
static const CGFloat CJGToastCornerRadius        = 10.0;
static const CGFloat CJGToastOpacity             = 0.8;
static const CGFloat CJGToastFontSize            = 16.0;
static const CGFloat CJGToastMaxTitleLines       = 0;
static const CGFloat CJGToastMaxMessageLines     = 0;
static const NSTimeInterval CJGToastFadeDuration = 0.2;

// shadow appearance
static const CGFloat CJGToastShadowOpacity       = 0.8;
static const CGFloat CJGToastShadowRadius        = 6.0;
static const CGSize  CJGToastShadowOffset        = { 4.0, 4.0 };
static const BOOL    CJGToastDisplayShadow       = YES;

// display duration
static const NSTimeInterval CJGToastDefaultDuration  = 3.0;

// image view size
static const CGFloat CJGToastImageViewWidth      = 80.0;
static const CGFloat CJGToastImageViewHeight     = 80.0;

// activity
static const CGFloat CJGToastActivityWidth       = 100.0;
static const CGFloat CJGToastActivityHeight      = 100.0;
static const NSString * CJGToastActivityDefaultPosition = @"center";

// interaction
static const BOOL CJGToastHidesOnTap             = YES;     // excludes activity views

// associative reference keys
static const NSString * CJGToastTimerKey         = @"CJGToastTimerKey";
static const NSString * CJGToastActivityViewKey  = @"CJGToastActivityViewKey";
static const NSString * CJGToastTapCallbackKey   = @"CJGToastTapCallbackKey";

// positions
NSString * const CJGToastPositionTop             = @"top";
NSString * const CJGToastPositionCenter          = @"center";
NSString * const CJGToastPositionBottom          = @"bottom";

@interface UIView (CJGToastPrivate)

- (void)cjg_hideToast:(UIView *)toast;
- (void)cjg_toastTimerDidFinish:(NSTimer *)timer;
- (void)cjg_handleToastTapped:(UITapGestureRecognizer *)recognizer;
- (CGPoint)cjg_centerPointForPosition:(id)position withToast:(UIView *)toast;
- (UIView *)cjg_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image;
- (CGSize)cjg_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end


@implementation UIView (CJGToast)

#pragma mark - Toast Methods

- (void)cjg_makeToast:(NSString *)message {
    [self cjg_makeToast:message duration:CJGToastDefaultDuration position:nil];
}

- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position {
    UIView *toast = [self cjg_viewForMessage:message title:nil image:nil];
    [self cjg_showToast:toast duration:duration position:position];
}

- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position title:(NSString *)title {
    UIView *toast = [self cjg_viewForMessage:message title:title image:nil];
    [self cjg_showToast:toast duration:duration position:position];
}

- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position image:(UIImage *)image {
    UIView *toast = [self cjg_viewForMessage:message title:nil image:image];
    [self cjg_showToast:toast duration:duration position:position];
}

- (void)cjg_makeToast:(NSString *)message duration:(NSTimeInterval)duration  position:(id)position title:(NSString *)title image:(UIImage *)image {
    UIView *toast = [self cjg_viewForMessage:message title:title image:image];
    [self cjg_showToast:toast duration:duration position:position];
}

- (void)cjg_showToast:(UIView *)toast {
    [self cjg_showToast:toast duration:CJGToastDefaultDuration position:nil];
}


- (void)cjg_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position {
    [self cjg_showToast:toast duration:duration position:position tapCallback:nil];
    
}


- (void)cjg_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position
      tapCallback:(void(^)(void))tapCallback
{
    toast.center = [self cjg_centerPointForPosition:position withToast:toast];
    toast.alpha = 0.0;
    
    if (CJGToastHidesOnTap) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:toast action:@selector(cjg_handleToastTapped:)];
        [toast addGestureRecognizer:recognizer];
        toast.userInteractionEnabled = YES;
        toast.exclusiveTouch = YES;
    }
    
    [self addSubview:toast];
    
    [UIView animateWithDuration:CJGToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         toast.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(cjg_toastTimerDidFinish:) userInfo:toast repeats:NO];
                         // associate the timer with the toast view
                         objc_setAssociatedObject (toast, &CJGToastTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         objc_setAssociatedObject (toast, &CJGToastTapCallbackKey, tapCallback, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                     }];
}


- (void)cjg_hideToast:(UIView *)toast {
    [UIView animateWithDuration:CJGToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         toast.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [toast removeFromSuperview];
                     }];
}

#pragma mark - Events

- (void)cjg_toastTimerDidFinish:(NSTimer *)timer {
    [self cjg_hideToast:(UIView *)timer.userInfo];
}

- (void)cjg_handleToastTapped:(UITapGestureRecognizer *)recognizer {
    NSTimer *timer = (NSTimer *)objc_getAssociatedObject(self, &CJGToastTimerKey);
    [timer invalidate];
    
    void (^callback)(void) = objc_getAssociatedObject(self, &CJGToastTapCallbackKey);
    if (callback) {
        callback();
    }
    [self cjg_hideToast:recognizer.view];
}

#pragma mark - Toast Activity Methods

- (void)cjg_makeToastActivity {
    [self cjg_makeToastActivity:CJGToastActivityDefaultPosition];
}

- (void)cjg_makeToastActivity:(id)position {
    // sanity
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &CJGToastActivityViewKey);
    if (existingActivityView != nil) return;
    
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CJGToastActivityWidth, CJGToastActivityHeight)];
    activityView.center = [self cjg_centerPointForPosition:position withToast:activityView];
    activityView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:CJGToastOpacity];
    activityView.alpha = 0.0;
    activityView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    activityView.layer.cornerRadius = CJGToastCornerRadius;
    
    if (CJGToastDisplayShadow) {
        activityView.layer.shadowColor = [UIColor blackColor].CGColor;
        activityView.layer.shadowOpacity = CJGToastShadowOpacity;
        activityView.layer.shadowRadius = CJGToastShadowRadius;
        activityView.layer.shadowOffset = CJGToastShadowOffset;
    }
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(activityView.bounds.size.width / 2, activityView.bounds.size.height / 2);
    [activityView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    // associate the activity view with self
    objc_setAssociatedObject (self, &CJGToastActivityViewKey, activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:activityView];
    
    [UIView animateWithDuration:CJGToastFadeDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         activityView.alpha = 1.0;
                     } completion:nil];
}

- (void)cjg_hideToastActivity {
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &CJGToastActivityViewKey);
    if (existingActivityView != nil) {
        [UIView animateWithDuration:CJGToastFadeDuration
                              delay:0.0
                            options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                         animations:^{
                             existingActivityView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [existingActivityView removeFromSuperview];
                             objc_setAssociatedObject (self, &CJGToastActivityViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         }];
    }
}

#pragma mark - Helpers

- (CGPoint)cjg_centerPointForPosition:(id)point withToast:(UIView *)toast {
    if([point isKindOfClass:[NSString class]]) {
        if([point caseInsensitiveCompare:CJGToastPositionTop] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + CJGToastVerticalPadding);
        } else if([point caseInsensitiveCompare:CJGToastPositionCenter] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
    } else if ([point isKindOfClass:[NSValue class]]) {
        return [point CGPointValue];
    }
    
    // default to bottom
    return CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - CJGToastVerticalPadding);
}

- (CGSize)cjg_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

- (UIView *)cjg_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image {
    // sanity
    if((message == nil) && (title == nil) && (image == nil)) return nil;

    // dynamically build a toast view with any combination of message, title, & image.
    UILabel *messageLabel = nil;
    UILabel *titleLabel = nil;
    UIImageView *imageView = nil;
    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = CJGToastCornerRadius;
    
    if (CJGToastDisplayShadow) {
        wrapperView.layer.shadowColor = [UIColor blackColor].CGColor;
        wrapperView.layer.shadowOpacity = CJGToastShadowOpacity;
        wrapperView.layer.shadowRadius = CJGToastShadowRadius;
        wrapperView.layer.shadowOffset = CJGToastShadowOffset;
    }

    wrapperView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:CJGToastOpacity];
    
    if(image != nil) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(CJGToastHorizontalPadding, CJGToastVerticalPadding, CJGToastImageViewWidth, CJGToastImageViewHeight);
    }
    
    CGFloat imageWidth, imageHeight, imageLeft;
    
    // the imageView frame values will be used to size & position the other views
    if(imageView != nil) {
        imageWidth = imageView.bounds.size.width;
        imageHeight = imageView.bounds.size.height;
        imageLeft = CJGToastHorizontalPadding;
    } else {
        imageWidth = imageHeight = imageLeft = 0.0;
    }
    
    if (title != nil) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = CJGToastMaxTitleLines;
        titleLabel.font = [UIFont boldSystemFontOfSize:CJGToastFontSize];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.alpha = 1.0;
        titleLabel.text = title;
        
        // size the title label according to the length of the text
        CGSize maxSizeTitle = CGSizeMake((self.bounds.size.width * CJGToastMaxWidth) - imageWidth, self.bounds.size.height * CJGToastMaxHeight);
        CGSize expectedSizeTitle = [self cjg_sizeForString:title font:titleLabel.font constrainedToSize:maxSizeTitle lineBreakMode:titleLabel.lineBreakMode];
        titleLabel.frame = CGRectMake(0.0, 0.0, expectedSizeTitle.width, expectedSizeTitle.height);
    }
    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = CJGToastMaxMessageLines;
        messageLabel.font = [UIFont systemFontOfSize:CJGToastFontSize];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake((self.bounds.size.width * CJGToastMaxWidth) - imageWidth, self.bounds.size.height * CJGToastMaxHeight);
        CGSize expectedSizeMessage = [self cjg_sizeForString:message font:messageLabel.font constrainedToSize:maxSizeMessage lineBreakMode:messageLabel.lineBreakMode];
        messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
    }
    
    // titleLabel frame values
    CGFloat titleWidth, titleHeight, titleTop, titleLeft;
    
    if(titleLabel != nil) {
        titleWidth = titleLabel.bounds.size.width;
        titleHeight = titleLabel.bounds.size.height;
        titleTop = CJGToastVerticalPadding;
        titleLeft = imageLeft + imageWidth + CJGToastHorizontalPadding;
    } else {
        titleWidth = titleHeight = titleTop = titleLeft = 0.0;
    }
    
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;

    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft = imageLeft + imageWidth + CJGToastHorizontalPadding;
        messageTop = titleTop + titleHeight + CJGToastVerticalPadding;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }

    CGFloat longerWidth = MAX(titleWidth, messageWidth);
    CGFloat longerLeft = MAX(titleLeft, messageLeft);
    
    // wrapper width uses the longerWidth or the image width, whatever is larger. same logic applies to the wrapper height
    CGFloat wrapperWidth = MAX((imageWidth + (CJGToastHorizontalPadding * 2)), (longerLeft + longerWidth + CJGToastHorizontalPadding));    
    CGFloat wrapperHeight = MAX((messageTop + messageHeight + CJGToastVerticalPadding), (imageHeight + (CJGToastVerticalPadding * 2)));
                         
    wrapperView.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    
    if(titleLabel != nil) {
        titleLabel.frame = CGRectMake(titleLeft, titleTop, titleWidth, titleHeight);
        [wrapperView addSubview:titleLabel];
    }
    
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        [wrapperView addSubview:messageLabel];
    }
    
    if(imageView != nil) {
        [wrapperView addSubview:imageView];
    }
        
    return wrapperView;
}

@end
