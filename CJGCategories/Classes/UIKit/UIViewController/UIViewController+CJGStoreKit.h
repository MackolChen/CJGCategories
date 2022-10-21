//
//  UIViewController+StoreKit.h
//  Picks
//
//  Created by Joe Fabisevich on 8/12/14.
//  Copyright (c) 2014 Snarkbots. All rights reserved.
//  https://github.com/mergesort/UIViewController-StoreKit

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

#define affiliateToken @"10laQX"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIViewController (CJGStoreKit)

@property NSString *cjg_campaignToken;
@property (nonatomic, copy) void (^cjg_loadingStoreKitItemBlock)(void);
@property (nonatomic, copy) void (^cjg_loadedStoreKitItemBlock)(void);

- (void)cjg_presentStoreKitItemWithIdentifier:(NSInteger)itemIdentifier;

+ (NSURL*)cjg_appURLForIdentifier:(NSInteger)identifier;

+ (void)cjg_openAppURLForIdentifier:(NSInteger)identifier;
+ (void)cjg_openAppReviewURLForIdentifier:(NSInteger)identifier;

+ (BOOL)cjg_containsITunesURLString:(NSString*)URLString;
+ (NSInteger)cjg_IDFromITunesURL:(NSString*)URLString;

@end
