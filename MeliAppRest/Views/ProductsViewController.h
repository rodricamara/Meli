//
//  ProductsViewController.h
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *products;

@end

