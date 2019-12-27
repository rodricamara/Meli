//
//  Constants.m
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "Constants.h"

@implementation Constants

// Constraints
NSInteger const kOffsetSide = 25;
NSInteger const kBorderWidth = 1;
NSInteger const kCornerRadius = 7;

// UI Elements
NSString *const kMainNavTitle = @"Mercado Libre";
NSString *const kPlaceholderSearch = @"Buscar en Mercado Libre";
NSString *const KButtonSearch = @"S";
NSInteger const kMaxNumberOfSearchCharacters = 30;

// Alerts
NSString *const kAlertErrorTitle = @"Error";
NSString *const kAlertErrorMessage = @"The system is unavilable. Try again or come back later";
NSString *const kAlertErrorAction = @"Ok";

// Meli API Rest
// Search example of "zapatillas": https://api.mercadolibre.com/sites/MLA/search?q=Zapatillas
NSString *const kBaseURL = @"https://api.mercadolibre.com";
NSString *const kSites = @"/sites";
NSString *const kMLA = @"/MLA";
NSString *const kSearch = @"/search?q=";


@end
