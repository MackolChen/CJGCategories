//
//  UIView+draggable.h
//  UIView+draggable
//
//  Created by Andrea on 13/03/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//
//  https://github.com/andreamazz/UIView-draggable
//  UIView category that adds dragging capabilities


#import <UIKit/UIKit.h>

@interface UIView (CJGDraggable)

/**-----------------------------------------------------------------------------
 * @name UIView+draggable Properties
 * -----------------------------------------------------------------------------
 */

/** The pan gestures that handles the view dragging
 *
 */
@property (nonatomic) UIPanGestureRecognizer *cjg_panGesture;

/**
 A caging area such that the view can not be moved outside
 of this frame.
 
 If @c cagingArea is not @c CGRectZero, and @c cagingArea does not contain the
 view's frame then this does nothing (ie. if the bounds of the view extend the
 bounds of @c cagingArea).
 
 Optional. If not set, defaults to @c CGRectZero, which will result
 in no caging behavior.
 */
@property (nonatomic) CGRect cjg_cagingArea;

/**
 Restricts the area of the view where the drag action starts.
 
 Optional. If not set, defaults to self.view.
 */
@property (nonatomic) CGRect cjg_handle;

/**
 Restricts the movement along the X axis
 */
@property (nonatomic) BOOL cjg_shouldMoveAlongX;

/**
 Restricts the movement along the Y axis
 */
@property (nonatomic) BOOL cjg_shouldMoveAlongY;

/**
 Notifies when dragging started
 */
@property (nonatomic, copy) void (^cjg_draggingStartedBlock)(void);

/**
 Notifies when dragging ended
 */
@property (nonatomic, copy) void (^cjg_draggingEndedBlock)(void);


/**-----------------------------------------------------------------------------
 * @name UIView+draggable Methods
 * -----------------------------------------------------------------------------
 */

/** Enables the dragging
 *
 * Enables the dragging state of the view
 */
- (void)cjg_enableDragging;

/** Disable or enable the view dragging
 *
 * @param draggable The boolean that enables or disables the draggable state
 */
- (void)cjg_setDraggable:(BOOL)draggable;

@end
