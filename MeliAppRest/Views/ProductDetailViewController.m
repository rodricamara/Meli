//
//  ProductDetailViewController.m
//  MeliAppRest
//
//  Created by marcos vissio on 27/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductModel.h"
#import "Masonry.h"
#import "Constants.h"
#import "UIImageView+AFNetworking.h"

@interface ProductDetailViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ProductModel *product;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *currencyIdLabel;
@property (nonatomic, strong) UILabel *available_quantityLabel;
@property (nonatomic, strong) UILabel *sold_quantityLabel;
@property (nonatomic, strong) UILabel *conditionLabel;
@property (nonatomic, strong) UILabel *adressLocationLabel;

@end

@implementation ProductDetailViewController

- (void)loadView {
    [super loadView];
    [self setupView];
    [self initializeAllViews];
    [self applyAllConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Called when the System determines amount of available memory is low
    [super didReceiveMemoryWarning];
}

- (instancetype)initWithProductModel: (ProductModel *)product {
    self = [self init];
    if (self){
        self.product = product;
    }
    return self;
}

- (void)setupView {
    // Navigation Controller
    [self.navigationItem setTitle:kUIProductDetailNavTitle];
    // View
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - private initialize methods

- (void)initializeAllViews {
    [self initializeScrollView];
    [self initializeContentView];
    [self initializeConditionLabel];
    [self initializeTitleLabel];
    [self initializeImage];
    [self initializePriceLabel];
    [self initializeAvailableQuantityLabel];
    [self initializeSoldQuantityLabel];
}

-(void)initializeScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.scrollView setBackgroundColor: [UIColor yellowColor]];
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.userInteractionEnabled=YES;
}
-(void)initializeContentView {
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView setBackgroundColor: [UIColor whiteColor]];
}

- (void)initializeConditionLabel {
    self.conditionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.conditionLabel.text = [self.product.condition capitalizedString];
    self.conditionLabel.textColor = [UIColor lightGrayColor];
    [self.conditionLabel setFont:[UIFont fontWithName:kFontAvenir size:10]];
    self.conditionLabel.numberOfLines = 1;
}

- (void)initializeTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.text = self.product.title;
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel setFont:[UIFont fontWithName:kFontAppleSD size:14]];
    self.titleLabel.numberOfLines = 2;
}

- (void)initializeImage {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    NSString *image = [self.product.pictures[0] objectForKey:@"secure_url"];
    NSURL *imageURL = [NSURL URLWithString:image];
    [self.imageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

- (void)initializePriceLabel {
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.text = [NSString stringWithFormat:@"$ %ld", self.product.price];
    self.priceLabel.textColor = [UIColor redColor];
    [self.priceLabel setFont:[UIFont fontWithName:kFontGilSans size:20]];
}

- (void)initializeAvailableQuantityLabel{
    self.available_quantityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.available_quantityLabel.text = [NSString stringWithFormat:@"%@: %@", kUIAvailableQuantity, self.product.available_quantity];
    self.available_quantityLabel.textColor = [UIColor grayColor];
    [self.available_quantityLabel setFont:[UIFont fontWithName:kFontAvenir size:12]];
}

- (void)initializeSoldQuantityLabel{
    self.sold_quantityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.sold_quantityLabel.text = [NSString stringWithFormat:@"%@: %@", kUISoldQuantity, self.product.sold_quantity];
    self.sold_quantityLabel.textColor = [UIColor grayColor];
    [self.sold_quantityLabel setFont:[UIFont fontWithName:kFontAvenir size:12]];
}

#pragma mark - private constraints methods

- (void)applyAllConstraints {
    [self applyConstraintsScrollView];
    [self applyConstraintsContentView];
    [self applyContraintsConditionLabel];
    [self applyContraintsTitleLabel];
    [self applyContraintsImage];
    [self applyContraintsPriceLabel];
    [self applyContraintsAvailableQuantityLabel];
    [self applyContraintsSoldQuantityLabel];
}

-(void)applyConstraintsScrollView {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)applyConstraintsContentView {
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.equalTo(@1000);
    }];
}

- (void)applyContraintsConditionLabel {
    [self.contentView addSubview:self.conditionLabel];
    [self.conditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top).offset(10);
        make.left.equalTo(self.scrollView.mas_left).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void)applyContraintsTitleLabel{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conditionLabel.mas_bottom).offset(10);
        make.left.equalTo(self.conditionLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void)applyContraintsImage{
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(40);
        make.right.equalTo(self.contentView).offset(-40);
        make.height.equalTo(self.imageView.mas_width);
    }];
}

- (void)applyContraintsPriceLabel{
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void)applyContraintsAvailableQuantityLabel{
    [self.contentView addSubview:self.available_quantityLabel];
    [self.available_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(10);
        make.left.equalTo(self.priceLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void)applyContraintsSoldQuantityLabel{
    [self.contentView addSubview:self.sold_quantityLabel];
    [self.sold_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.available_quantityLabel.mas_bottom).offset(5);
        make.left.equalTo(self.available_quantityLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

@end
