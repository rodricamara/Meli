//
//  ViewController.m
//  MeliAppRest
//
//  Created by marcos vissio on 20/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "MainViewController.h"
#import "Constants.h"
#import "Masonry.h"
#import "MeliService.h"
#import "ProductsViewController.h"

@interface MainViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIBarButtonItem *searchBarButton;

@end

@implementation MainViewController

- (void)loadView {
    [super loadView];
    [self initializeAllViews];
    [self applyAllConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationController];
    self.searchField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    // Every time MainVC is loaded, searchTextfield is cleaned.
    [self.searchField setText:@""];
    // Every time MainVC is loaded, seatchButton is disabled.
    self.searchButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    // Called when the System determines amount of available memory is low
    [super didReceiveMemoryWarning];
}

#pragma mark - private navigation controller methods

- (void) setupNavigationController {
    [self.navigationController.navigationBar setBarTintColor:[UIColor yellowColor]];
    [self.navigationItem setTitle:kUIMainNavTitle];
    [self.navigationItem setTitleView:self.searchField];
    [self.searchField becomeFirstResponder];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchButton];
}

#pragma mark - private initialize methods

- (void)initializeAllViews {
    [self initializeScrollView];
    [self initializeContentView];
    [self initializeSearchField];
    [self initializeSearchButton];
}

- (void)initializeScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.scrollView setBackgroundColor: [UIColor yellowColor]];
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.userInteractionEnabled=YES;
}
- (void)initializeContentView {
    // TODO: It will contain UI Elements in future implementations
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView setBackgroundColor: [UIColor whiteColor]];
}

- (void)initializeSearchField {
    self.searchField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:kUIPlaceholderSearch];
    self.searchField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchField.layer.borderWidth = kConstraintBorderWidth;
    self.searchField.layer.cornerRadius = kConstraintCornerRadius;
    [self.searchField setBackgroundColor:[UIColor whiteColor]];
    [self.searchField setFont:[UIFont fontWithName:kFontAvenir size:15]];
}

- (void)initializeSearchButton {
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.searchButton setImage:[UIImage imageNamed:KUIButtonImage] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(startSearch) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initializeSearchBarButton {
    self.searchBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:KUIButtonImage] style:UIBarButtonItemStylePlain target:self action:nil];
}

#pragma mark - private constraints methods

- (void)applyAllConstraints {
    [self applyConstraintsScrollView];
    [self applyConstraintsContentView];
    [self applyConstraintsSearchButton];
    [self applyConstraintsSearchField];
}

- (void)applyConstraintsScrollView {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)applyConstraintsContentView {
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.equalTo(@500);
    }];
}

- (void)applyConstraintsSearchButton {
    [self.view addSubview:self.searchButton];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
}

- (void)applyConstraintsSearchField {
    [self.view addSubview:self.searchField];
    [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.navigationController.navigationBar.frame.size.width - self.navigationController.navigationBar.frame.size.width/4));
    }];
}

#pragma mark - private UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    
    NSString *stringTextField = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSUInteger lenghtTextField = stringTextField.length;
    
    // Do not allow the first character to be space | Do not allow more than one space
    if ([string isEqualToString:@" "]) {
        if (!textField.text.length)
            return NO;
        if ([stringTextField rangeOfString:@"  "].length)
            return NO;
    }
    // Enable button when search has betwenn 2 and 30 characters
    if (lenghtTextField < 2 || lenghtTextField > 30) {
        self.searchButton.enabled = NO;
    } else {
        self.searchButton.enabled = YES;
    }
    return YES;
}

#pragma mark - private methods

- (void)startSearch {
    
    [self.searchButton setEnabled:NO];
    
    NSString *searchInput = [self.searchField text];
    NSString *searchInputFormated = [searchInput stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *baseURL = [NSURL URLWithString:kAPIBaseURL];
    NSString *path = [NSString stringWithFormat: @"%@%@%@%@", kAPISites, kAPISiteID, kAPISearch, searchInputFormated];
    
    [MeliService getProducts:(NSURL *)baseURL andResources: path andSuccesBlock:^(id response) {
        
        [self.searchButton setEnabled:YES];
        
        NSLog(@"Search for: %@, Results: %@",searchInput, [response objectForKey:@"results"]);
        
        ProductsViewController *productsVC = [[ProductsViewController alloc] init];
        productsVC.products = [response objectForKey:@"results"];
        
        [self.navigationController pushViewController:productsVC animated:YES];
        
    }        andFailureBlock:^(NSError *error) {
        NSLog(@"Error in search: %@",error);
        [self popupErrorAlert];
    }];
}

- (void)popupErrorAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:kAlertErrorTitle message:kAlertErrorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:kAlertErrorAction style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.searchButton setEnabled:YES];
    }];
    [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dismissKeyboardWithTapOnView {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.scrollView action:@selector(endEditing)];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

@end
