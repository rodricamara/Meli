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

@interface ProductDetailViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ProductModel *product;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sellerLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *currencyIdLabel;
@property (nonatomic, strong) UILabel *available_quantityLabel;
@property (nonatomic, strong) UILabel *sold_quantityLabel;
@property (nonatomic, strong) UILabel *conditionLabel;
@property (nonatomic, strong) UILabel *adressLocationLabel;
@property (nonatomic, strong) NSMutableArray *picturesMutArray;

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

- (instancetype) initWithProductModel: (ProductModel *) product {
    self = [self init];
    if (self){
        self.product = product;
    }
    return self;
}

- (void) setupView {
    // Navigation Controller
    [self.navigationItem setTitle:kProductDetailNavTitle];
    // View
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void) initializeAllViews {
    [self initializeScrollView];
    [self initializeContentView];
    [self initializeConditionLabel];
    [self initializeTitleLabel];
    [self initializePriceLabel];
    [self initializeAvailableQuantityLabel];
    [self initializeSoldQuantityLabel];
}

- (void) applyAllConstraints {
    [self applyConstraintsScrollView];
    [self applyConstraintsContentView];
    [self applyContraintsConditionLabel];
    [self applyContraintsTitleLabel];
    [self applyContraintsPriceLabel];
    [self applyContraintsAvailableQuantityLabel];
    [self applyContraintsSoldQuantityLabel];
}

-(void) initializeScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.scrollView setBackgroundColor: [UIColor yellowColor]];
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.userInteractionEnabled=YES;
}
-(void) initializeContentView {
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView setBackgroundColor: [UIColor whiteColor]];
}

- (void) initializeConditionLabel {
    self.conditionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.conditionLabel.text = [self.product.condition capitalizedString];
    self.conditionLabel.textColor = [UIColor lightGrayColor];
    [self.conditionLabel setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    self.conditionLabel.numberOfLines = 1;
}

- (void) initializeTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.text = self.product.title;
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    self.titleLabel.numberOfLines = 2;
}

- (void) initializePriceLabel {
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.text = [NSString stringWithFormat:@"$ %ld", self.product.price];
    self.priceLabel.textColor = [UIColor redColor];
    [self.priceLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
}

- (void) initializeAvailableQuantityLabel{
    self.available_quantityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.available_quantityLabel.text = [NSString stringWithFormat:@"%@: %@", kAvailableQuantity, self.product.available_quantity];
    self.available_quantityLabel.textColor = [UIColor grayColor];
    [self.available_quantityLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
}

- (void) initializeSoldQuantityLabel{
    self.sold_quantityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.sold_quantityLabel.text = [NSString stringWithFormat:@"%@: %@", kSoldQuantity, self.product.sold_quantity];
    self.sold_quantityLabel.textColor = [UIColor grayColor];
    [self.sold_quantityLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
}

-(void) applyConstraintsScrollView {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void) applyConstraintsContentView {
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.equalTo(@1000);
    }];
}

- (void) applyContraintsConditionLabel {
    [self.contentView addSubview:self.conditionLabel];
    [self.conditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top).offset(10);
        make.left.equalTo(self.scrollView.mas_left).offset(10);
    }];
}

- (void) applyContraintsTitleLabel{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conditionLabel.mas_bottom).offset(10);
        make.left.equalTo(self.conditionLabel);
    }];
}

- (void) applyContraintsPriceLabel{
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel);
    }];
}

- (void) applyContraintsAvailableQuantityLabel{
    [self.contentView addSubview:self.available_quantityLabel];
    [self.available_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(10);
        make.left.equalTo(self.priceLabel);
    }];
}

- (void) applyContraintsSoldQuantityLabel{
    [self.contentView addSubview:self.sold_quantityLabel];
    [self.sold_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.available_quantityLabel.mas_bottom).offset(5);
        make.left.equalTo(self.available_quantityLabel);
    }];
}

@end
