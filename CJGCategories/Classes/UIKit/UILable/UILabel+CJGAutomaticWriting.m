//
//  UILabel+AutomaticWriting.m
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//

#import "UILabel+CJGAutomaticWriting.h"
#import <objc/runtime.h>


NSTimeInterval const UILabelAWDefaultDuration = 0.4f;

unichar const UILabelAWDefaultCharacter = 124;

static inline void cjg_AutomaticWritingSwizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static char kAutomaticWritingOperationQueueKey;
static char kAutomaticWritingEdgeInsetsKey;


@implementation UILabel (CJGAutomaticWriting)

@dynamic cjg_automaticWritingOperationQueue, cjg_edgeInsets;

#pragma mark - Public Methods

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cjg_AutomaticWritingSwizzleSelector([self class], @selector(textRectForBounds:limitedToNumberOfLines:), @selector(cjg_automaticWritingTextRectForBounds:limitedToNumberOfLines:));
        cjg_AutomaticWritingSwizzleSelector([self class], @selector(drawTextInRect:), @selector(cjg_drawAutomaticWritingTextInRect:));
    });
}

-(void)cjg_drawAutomaticWritingTextInRect:(CGRect)rect
{
    [self cjg_drawAutomaticWritingTextInRect:UIEdgeInsetsInsetRect(rect, self.cjg_edgeInsets)];
}

- (CGRect)cjg_automaticWritingTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self cjg_automaticWritingTextRectForBounds:UIEdgeInsetsInsetRect(bounds, self.cjg_edgeInsets) limitedToNumberOfLines:numberOfLines];
    return textRect;
}

- (void)setCjg_edgeInsets:(UIEdgeInsets)edgeInsets
{
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)cjg_edgeInsets
{
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey);
    
    if (edgeInsetsValue)
    {
        return edgeInsetsValue.UIEdgeInsetsValue;
    }
    
    edgeInsetsValue = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, edgeInsetsValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return edgeInsetsValue.UIEdgeInsetsValue;
}

- (void)setCjg_automaticWritingOperationQueue:(NSOperationQueue *)automaticWritingOperationQueue
{
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, automaticWritingOperationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSOperationQueue *)cjg_automaticWritingOperationQueue
{
    NSOperationQueue *operationQueue = objc_getAssociatedObject(self, &kAutomaticWritingOperationQueueKey);
    
    if (operationQueue)
    {
        return operationQueue;
    }
    
    operationQueue = NSOperationQueue.new;
    operationQueue.name = @"Automatic Writing Operation Queue";
    operationQueue.maxConcurrentOperationCount = 1;
    
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, operationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return operationQueue;
}

- (void)cjg_setTextWithAutomaticWritingAnimation:(NSString *)text
{
    [self cjg_setText:text automaticWritingAnimationWithBlinkingMode:UILabelCJGlinkingModeNone];
}

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelCJGlinkingMode)blinkingMode
{
    [self cjg_setText:text automaticWritingAnimationWithDuration:UILabelAWDefaultDuration blinkingMode:blinkingMode];
}

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
{
    [self cjg_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:UILabelCJGlinkingModeNone];
}

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode
{
    [self cjg_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:UILabelAWDefaultCharacter];
}

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter
{
    [self cjg_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:blinkingCharacter completion:nil];
}

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion
{
    self.cjg_automaticWritingOperationQueue.suspended = YES;
    self.cjg_automaticWritingOperationQueue = nil;
    
    self.text = @"";
    
    NSMutableString *automaticWritingText = NSMutableString.new;
    
    if (text)
    {
        [automaticWritingText appendString:text];
    }
    
    [self.cjg_automaticWritingOperationQueue addOperationWithBlock:^{
        [self cjg_automaticWriting:automaticWritingText duration:duration mode:blinkingMode character:blinkingCharacter completion:completion];
    }];
}

#pragma mark - Private Methods

- (void)cjg_automaticWriting:(NSMutableString *)text duration:(NSTimeInterval)duration mode:(UILabelCJGlinkingMode)mode character:(unichar)character completion:(void (^)(void))completion
{
    NSOperationQueue *currentQueue = NSOperationQueue.currentQueue;
    if ((text.length || mode >= UILabelCJGlinkingModeWhenFinish) && !currentQueue.isSuspended)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (mode != UILabelCJGlinkingModeNone)
            {
                if ([self cjg_isLastCharacter:character])
                {
                    [self cjg_deleteLastCharacter];
                }
                else if (mode != UILabelCJGlinkingModeWhenFinish || !text.length)
                {
                    [text insertString:[self cjg_stringWithCharacter:character] atIndex:0];
                }
            }
            
            if (text.length)
            {
                [self cjg_appendCharacter:[text characterAtIndex:0]];
                [text deleteCharactersInRange:NSMakeRange(0, 1)];
                if ((![self cjg_isLastCharacter:character] && mode == UILabelCJGlinkingModeWhenFinishShowing) || (!text.length && mode == UILabelCJGlinkingModeUntilFinishKeeping))
                {
                    [self cjg_appendCharacter:character];
                }
            }
            
            if (!currentQueue.isSuspended)
            {
                [currentQueue addOperationWithBlock:^{
                    [self cjg_automaticWriting:text duration:duration mode:mode character:character completion:completion];
                }];
            }
            else if (completion)
            {
                completion();
            }
        });
    }
    else if (completion)
    {
        completion();
    }
}

- (NSString *)cjg_stringWithCharacter:(unichar)character
{
    return [self cjg_stringWithCharacters:@[@(character)]];
}

- (NSString *)cjg_stringWithCharacters:(NSArray *)characters
{
    NSMutableString *string = NSMutableString.new;
    
    for (NSNumber *character in characters)
    {
        [string appendFormat:@"%C", character.unsignedShortValue];
    }
    
    return string.copy;
}

- (void)cjg_appendCharacter:(unichar)character
{
    [self cjg_appendCharacters:@[@(character)]];
}

- (void)cjg_appendCharacters:(NSArray *)characters
{
    self.text = [self.text stringByAppendingString:[self cjg_stringWithCharacters:characters]];
}

- (BOOL)cjg_isLastCharacters:(NSArray *)characters
{
    if (self.text.length >= characters.count)
    {
        return [self.text hasSuffix:[self cjg_stringWithCharacters:characters]];
    }
    return NO;
}

- (BOOL)cjg_isLastCharacter:(unichar)character
{
    return [self cjg_isLastCharacters:@[@(character)]];
}

- (BOOL)cjg_deleteLastCharacters:(NSUInteger)characters
{
    if (self.text.length >= characters)
    {
        self.text = [self.text substringToIndex:self.text.length-characters];
        return YES;
    }
    return NO;
}

- (BOOL)cjg_deleteLastCharacter
{
    return [self cjg_deleteLastCharacters:1];
}

@end
