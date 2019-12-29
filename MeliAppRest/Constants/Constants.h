//
//  Constants.h
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

// Fonts: http://iosfonts.com/
extern NSString *const kFontAppleSD;
extern NSString *const kFontAvenir;
extern NSString *const kFontGilSans;

// Constraints
extern NSInteger const kOffsetSide;
extern NSInteger const kBorderWidth;
extern NSInteger const kCornerRadius;

// UI Elements
extern NSString *const kUIMainNavTitle;
extern NSString *const kUIPlaceholderSearch;
extern NSString *const KUIButtonImage;
extern NSInteger const kUIMaxNumberOfSearchCharacters;
extern NSString *const kUIProductDetailNavTitle;
extern NSString *const kUIProductsNavTitle;
extern NSString *const kUIAvailableQuantity;
extern NSString *const kUISoldQuantity;
extern NSString *const kUIFreeShipping;

// Alerts
extern NSString *const kAlertErrorTitle;
extern NSString *const kAlertErrorMessage;
extern NSString *const kAlertEmptySearchMessage;
extern NSString *const kAlertErrorAction;

// Meli API Rest
extern NSString *const kAPIBaseURL;
extern NSString *const kAPISites;
extern NSString *const kAPISiteID;
extern NSString *const kAPISearch;
extern NSString *const kAPIItem;

@end
