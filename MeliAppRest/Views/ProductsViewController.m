//
//  ProductsViewController.m
//  MeliAppRest
//
//  Created by marcos vissio on 26/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "ProductsViewController.h"
#import "Masonry.h"
#import "ProductsTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "Constants.h"
#import "MeliService.h"
#import "ProductModel.h"
#import "ProductDetailViewController.h"

static NSString *cellIdentifier = @"ProductCell";

@interface ProductsViewController ()

@property (nonatomic, strong) UITableView *tableProducts;
@property (nonatomic) BOOL productSelected;

@end

@implementation ProductsViewController

- (void)loadView {
    [super loadView];
    [self setupView];
    
    if ([self.products count] != 0) {
        [self initializeTableProducts];
        [self applyConstraintsTableProducts];
    } else {
        [self popUpEmptySearchAlert];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    self.productSelected = NO;
}

- (void)didReceiveMemoryWarning {
    // Called when the System determines amount of available memory is low
    [super didReceiveMemoryWarning];
}

- (void) setupView {
    // Navigation Controller
    [self.navigationItem setTitle:kProductsNavTitle];
    // View
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - private initialize methods

-(void) initializeTableProducts{
    self.tableProducts = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableProducts.backgroundColor = [UIColor whiteColor];
    self.tableProducts.delegate = self;
    self.tableProducts.dataSource = self;
}

#pragma mark - private constraints methods

-(void) applyConstraintsTableProducts {
    [self.view addSubview:self.tableProducts];
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 10, 10, 10);
    [self.tableProducts mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ProductsTableViewCell *cell = (ProductsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[ProductsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *products = [self.products objectAtIndex:indexPath.row];
    
    NSString *title = [products objectForKey:@"title"];
    long price = (long)[[products objectForKey:@"price"] longLongValue];
    
    NSString *image =  [products objectForKey:@"thumbnail"];
    NSURL *imageURL = [NSURL URLWithString:image];
    
    [cell.image setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.titleLabel.text = title;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%lu", price];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dictionary = [self.products objectAtIndex:indexPath.row];
    NSString *itemID = [dictionary objectForKey:@"id"];
    
    if (!self.productSelected){
        self.productSelected = YES;
        [self getProductDetail:itemID];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)getProductDetail:(NSString *) itemID {
    
    NSURL *baseURL = [NSURL URLWithString:kBaseURL];
    NSString *path = [NSString stringWithFormat: @"%@/%@", kItem, itemID];
    
    [MeliService getProducts:(NSURL *)baseURL andResources:path andSuccesBlock:^(id response) {
        
        ProductModel *productModel = [[ProductModel alloc] initWithDictionary:response];
        ProductDetailViewController *productDetailVC = [[ProductDetailViewController alloc] initWithProductModel: productModel];
        
        [self.navigationController pushViewController:productDetailVC animated:YES];
    }       andFailureBlock:^(NSError *error) {
        NSLog(@"Error in Item Details API: %@",error);
        [self popupErrorAlert];
    }];
}

-(void) popupErrorAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:kAlertErrorTitle message:kAlertErrorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:kAlertErrorAction style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)popUpEmptySearchAlert {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:kAlertErrorTitle message:kAlertEmptySearchMessage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOK = [UIAlertAction actionWithTitle:kAlertErrorAction style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:actionOK];
        [self presentViewController:alert animated:YES completion:nil];
}

@end
