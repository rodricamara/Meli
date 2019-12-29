//
//  ProductDetailViewController.h
//  MeliAppRest
//
//  Created by marcos vissio on 27/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface ProductDetailViewController : UIViewController

- (instancetype)initWithProductModel: (ProductModel *) product;

@end

