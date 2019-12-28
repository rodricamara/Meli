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
NSInteger const kOffsetSide = 25;
NSInteger const kBorderWidth = 1;
NSInteger const kCornerRadius = 7;

// UI Elements
NSString *const kMainNavTitle = @"Mercado Libre";
NSString *const kPlaceholderSearch = @" Find in Mercado Libre";
NSString *const KButtonImage = @"searchImage.png";
NSInteger const kMaxNumberOfSearchCharacters = 30;
NSString *const kProductDetailNavTitle = @"Product Detail";
NSString *const kProductsNavTitle = @"Search Results";
NSString *const kAvailableQuantity = @"Available quantity";
NSString *const kSoldQuantity = @"Sold quantity";

// Alerts
NSString *const kAlertErrorTitle = @"Error";
NSString *const kAlertErrorMessage = @"The system is unavilable. Try again or come back later";
NSString *const kAlertEmptySearchMessage = @"The search could not find anything. Please try again";
NSString *const kAlertErrorAction = @"Ok";

// Meli API Rest
// Search example of "zapatillas": https://api.mercadolibre.com/sites/MLA/search?q=Zapatillas
NSString *const kBaseURL = @"https://api.mercadolibre.com";
NSString *const kSites = @"/sites";
NSString *const kMLA = @"/MLA";
NSString *const kSearch = @"/search?q=";
NSString *const kItem = @"/items";

@end
