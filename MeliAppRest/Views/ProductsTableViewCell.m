//
//  ProductsTableViewCell.m
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "ProductsTableViewCell.h"
#import "Masonry.h"
#import "Constants.h"

@implementation ProductsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeImage];
        [self initializeTitleLabel];
        [self initializePriceLabel];
        [self initializeShippingLabel];
        [self applyConstraintsImage];
        [self applyConstraintsTitleLabel];
        [self applyConstraintsPriceLabel];
        [self applyConstraintsShippingLabel];
    }
    return self;
}

#pragma mark - private initialize methods

- (void)initializeImage {
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
}

- (void)initializeTitleLabel{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel setFont:[UIFont fontWithName:kFontAppleSD size:12]];
    self.titleLabel.numberOfLines = 3;
}

- (void)initializePriceLabel{
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.textColor = [UIColor redColor];
    [self.priceLabel setFont:[UIFont fontWithName:kFontGilSans size:14]];
}

- (void)initializeShippingLabel{
    self.shippingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.shippingLabel.textColor = [UIColor greenColor];
    [self.shippingLabel setFont:[UIFont fontWithName:kFontGilSans size:10]];
}

#pragma mark - private constraints methods

- (void)applyConstraintsImage{
    [self.contentView addSubview:self.image];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@80);
        make.width.equalTo(@80);
    }];
}

- (void)applyConstraintsTitleLabel{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.image.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void)applyConstraintsPriceLabel{
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left).offset(5);
    }];
}

- (void)applyConstraintsShippingLabel{
    [self.contentView addSubview:self.shippingLabel];
    [self.shippingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left).offset(5);
    }];
}

@end
