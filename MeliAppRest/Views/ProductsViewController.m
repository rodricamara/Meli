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

static NSString *cellIdentifier = @"ProductCell";

@interface ProductsViewController ()

@property (nonatomic, strong) UITableView *tableProducts;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    [super loadView];
    [self initializeTableProducts];
    [self applyConstraintsTableProducts];
}

#pragma mark - private constraints methods

-(void) initializeTableProducts{
    self.tableProducts = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableProducts.backgroundColor = [UIColor whiteColor];
    self.tableProducts.delegate = self;
    self.tableProducts.dataSource = self;
}

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
    //self buttonPressed
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


@end
