//
//  Constants.h
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

// Constraints
extern NSInteger const kOffsetSide;
extern NSInteger const kBorderWidth;
extern NSInteger const kCornerRadius;

// UI Elements
extern NSString *const kMainNavTitle;
extern NSString *const kPlaceholderSearch;
extern NSString *const KButtonSearch;
extern NSInteger const kMaxNumberOfSearchCharacters;
extern NSString *const kProductDetailNavTitle;
extern NSString *const kProductsNavTitle;
extern NSString *const kAvailableQuantity;
extern NSString *const kSoldQuantity;

// Alerts
extern NSString *const kAlertErrorTitle;
extern NSString *const kAlertErrorMessage;
extern NSString *const kAlertErrorAction;

// Meli API Rest
extern NSString *const kBaseURL;
extern NSString *const kSites;
extern NSString *const kMLA;
extern NSString *const kSearch;
extern NSString *const kItem;

@end
