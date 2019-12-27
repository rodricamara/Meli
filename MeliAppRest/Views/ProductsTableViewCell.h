//
//  ProductsTableViewCell.h
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProductsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

