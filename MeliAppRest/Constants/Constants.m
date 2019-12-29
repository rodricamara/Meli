//
//  Constants.m
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "Constants.h"

@implementation Constants

// Fonts: http://iosfonts.com/
NSString *const kFontAppleSD = @"Apple SD Gothic Neo";
NSString *const kFontAvenir = @"Avenir";
NSString *const kFontGilSans = @"Gill Sans";

// Constraints
NSInteger const kConstraintBorderWidth = 1;
NSInteger const kConstraintCornerRadius = 7;

// UI Elements
NSString *const kUIMainNavTitle = @"Mercado Libre";
NSString *const kUIPlaceholderSearch = @" Find in Mercado Libre";
NSString *const KUIButtonImage = @"searchImage.png";
NSInteger const kUIMaxNumberOfSearchCharacters = 30;
NSString *const kUIProductDetailNavTitle = @"Product Detail";
NSString *const kUIProductsNavTitle = @"Search Results";
NSString *const kUIAvailableQuantity = @"Available quantity";
NSString *const kUISoldQuantity = @"Sold quantity";
NSString *const kUIFreeShipping = @"Free Shipping";

// Alerts
NSString *const kAlertErrorTitle = @"Error";
NSString *const kAlertErrorMessage = @"The system is unavilable. Try again or come back later";
NSString *const kAlertEmptySearchMessage = @"The search could not find anything. Please try again";
NSString *const kAlertErrorAction = @"Ok";

// Meli API Rest
// Search example of "zapatillas": https://api.mercadolibre.com/sites/MLA/search?q=Zapatillas
NSString *const kAPIBaseURL = @"https://api.mercadolibre.com";
NSString *const kAPISites = @"/sites";
NSString *const kAPISiteID = @"/MLA";
NSString *const kAPISearch = @"/search?q=";
NSString *const kAPIItem = @"/items";

@end
