//
//  ProductModel.h
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProductModel : NSObject

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

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

