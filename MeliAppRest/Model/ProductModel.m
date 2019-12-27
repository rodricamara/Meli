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
}

/*
 @property (nonatomic, strong) NSString *itemId;
 @property (nonatomic, strong) NSString *title;
 @property (nonatomic, strong) NSString *seller;
 @property (nonatomic) long price;
 @property (nonatomic, strong) NSString *currencyId;
 @property (nonatomic, strong) NSString *available_quantity;
 @property (nonatomic, strong) NSString *sold_quantity;
 @property (nonatomic, strong) NSString *condition;
 @property (nonatomic, strong) NSDictionary *adressLocation;
 @property (nonatomic, strong) NSArray *pictures;
 */

@end
