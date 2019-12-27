//
//  ProductModel.m
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
    }
    return self;
}

- (void) setDictionary: (NSDictionary *) dictionary {
    self.itemId = [dictionary objectForKey:@"id"];
    self.title = [dictionary objectForKey:@"title"];
    self.seller = [[dictionary objectForKey:@"seller"] objectForKey:@"id"];
    self.price = [[dictionary objectForKey:@"price"] longLongValue];
    self.currencyId = [dictionary objectForKey:@"currencyId"];
    self.available_quantity = [dictionary objectForKey:@"available_quantity"];
    self.sold_quantity = [dictionary objectForKey:@"sold_quantity"];
    self.condition = [dictionary objectForKey:@"condition"];
    self.adressLocation = [dictionary objectForKey:@"adressLocation"];
    self.pictures = [dictionary objectForKey:@"pictures"];
}

@end
