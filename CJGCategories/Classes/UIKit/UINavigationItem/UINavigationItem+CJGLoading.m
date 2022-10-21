//
// UINavigationItem+Loading.m
//
// Copyright (c) 2015 Anton Gaenko
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
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UINavigationItem+CJGLoading.h"
#import <objc/runtime.h>

static void *CJGLoaderPositionAssociationKey = &CJGLoaderPositionAssociationKey;
static void *CJGSubstitutedViewAssociationKey = &CJGSubstitutedViewAssociationKey;

@implementation UINavigationItem (CJGLoading)

- (void)cjg_startAnimatingAt:(CJGNavBarLoaderPosition)position {
    // stop previous if animated
    [self cjg_stopAnimating];
    
    // hold reference for position to stop at the right place
    objc_setAssociatedObject(self, CJGLoaderPositionAssociationKey, @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIActivityIndicatorView* loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    // substitute bar views to loader and hold reference to them for restoration
    switch (position) {
        case CJGNavBarLoaderPositionLeft:
            objc_setAssociatedObject(self, CJGSubstitutedViewAssociationKey, self.leftBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.leftBarButtonItem.customView = loader;
            break;
            
        case CJGNavBarLoaderPositionCenter:
            objc_setAssociatedObject(self, CJGSubstitutedViewAssociationKey, self.titleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.titleView = loader;
            break;
            
        case CJGNavBarLoaderPositionRight:
            objc_setAssociatedObject(self, CJGSubstitutedViewAssociationKey, self.rightBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.rightBarButtonItem.customView = loader;
            break;
    }
    
    [loader startAnimating];
}

- (void)cjg_stopAnimating {
    NSNumber* positionToRestore = objc_getAssociatedObject(self, CJGLoaderPositionAssociationKey);
    id componentToRestore = objc_getAssociatedObject(self, CJGSubstitutedViewAssociationKey);
    
    // restore UI if animation was in a progress
    if (positionToRestore) {
        switch (positionToRestore.intValue) {
            case CJGNavBarLoaderPositionLeft:
                self.leftBarButtonItem.customView = componentToRestore;
                break;
                
            case CJGNavBarLoaderPositionCenter:
                self.titleView = componentToRestore;
                break;
                
            case CJGNavBarLoaderPositionRight:
                self.rightBarButtonItem.customView = componentToRestore;
                break;
        }
    }
    
    objc_setAssociatedObject(self, CJGLoaderPositionAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, CJGSubstitutedViewAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
