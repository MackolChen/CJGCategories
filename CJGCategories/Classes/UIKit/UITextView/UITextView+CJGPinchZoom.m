//
//  UITextView+PinchZoom.m
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//

#import "UITextView+CJGPinchZoom.h"
#import "objc/runtime.h"

static int cjg_minFontSizeKey;
static int cjg_maxFontSizeKey;
static int cjg_zoomEnabledKey;

@implementation UITextView (JKPinchZoom)

- (void)setCjg_maxFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &cjg_maxFontSizeKey, [NSNumber numberWithFloat:maxFontSize],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cjg_maxFontSize
{
    return [objc_getAssociatedObject(self, &cjg_maxFontSizeKey) floatValue];
}

- (void)setCjg_minFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &cjg_minFontSizeKey, [NSNumber numberWithFloat:maxFontSize],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cjg_minFontSize
{
    return [objc_getAssociatedObject(self, &cjg_minFontSizeKey) floatValue];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)gestureRecognizer
{
    if (!self.iscjg_zoomEnabled) return;

    CGFloat pointSize = (gestureRecognizer.velocity > 0.0f ? 1.0f : -1.0f) + self.font.pointSize;

    pointSize = MAX(MIN(pointSize, self.cjg_maxFontSize), self.cjg_minFontSize);

    self.font = [UIFont fontWithName:self.font.fontName size:pointSize];
}


- (void)setCjg_zoomEnabled:(BOOL)zoomEnabled
{
    objc_setAssociatedObject(self, &cjg_zoomEnabledKey, [NSNumber numberWithBool:zoomEnabled],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (zoomEnabled) {
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) // initialized already
            if ([recognizer isKindOfClass:[UIPinchGestureRecognizer class]]) return;

        self.cjg_minFontSize = self.cjg_minFontSize ?: 8.0f;
        self.cjg_maxFontSize = self.cjg_maxFontSize ?: 42.0f;
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]
                                                     initWithTarget:self action:@selector(pinchGesture:)];
        [self addGestureRecognizer:pinchRecognizer];
#if !__has_feature(objc_arc)
        [pinchRecognizer release];
#endif
    }
}

- (BOOL)iscjg_zoomEnabled
{
    return [objc_getAssociatedObject(self, &cjg_zoomEnabledKey) boolValue];
}

@end
