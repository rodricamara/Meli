//
//  ProductsTableViewCell.m
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "ProductsTableViewCell.h"
#import "Masonry.h"

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
        [self applyConstraintsImage];
        [self applyConstraintsTitleLabel];
        [self applyConstraintsPriceLabel];
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
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    self.titleLabel.numberOfLines = 2;
}

- (void)initializePriceLabel{
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.textColor = [UIColor redColor];
    [self.priceLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
}

#pragma mark - private constraints methods

- (void) applyConstraintsImage{
    [self addSubview:self.image];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@70);
        make.width.equalTo(@70);
    }];
}

- (void) applyConstraintsTitleLabel{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(25);
        make.left.equalTo(self.image.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void) applyConstraintsPriceLabel{
    [self addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left);
    }];
}

@end
