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

@interface MainViewController ()

@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIView *searchView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    [super loadView];
    [self setupView];
    [self initializeAllViews];
    [self applyAllConstraints];
    
}
- (void) setupView {
    // Navigation Controller
    [self.navigationItem setTitle:kMainNavTitle];
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    // View
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - private initialize methods

- (void) initializeAllViews {
    [self initializeSearchView];
    [self initializeScrollView];
    [self initializeContentView];
    [self initializeSearchField];
    [self initializeSearchButton];
}

-(void) initializeSearchView {
    self.searchView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.searchView setBackgroundColor: [UIColor yellowColor]];
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

- (void) initializeSearchField {
    self.searchField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:kPlaceholderSearch];
    self.searchField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchField.layer.borderWidth = kBorderWidth;
    self.searchField.layer.cornerRadius = kCornerRadius;
}

- (void) initializeSearchButton {
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.searchButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchButton.layer.borderWidth = kBorderWidth;
    self.searchButton.layer.cornerRadius = kCornerRadius;
    [self.searchButton setTitle:KButtonSearch forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(startSearch) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - private constraints methods

-(void) applyAllConstraints {
    [self applyConstraintsSearchView];
    [self applyConstraintsScrollView];
    [self applyConstraintsContentView];
    [self applyConstraintssearchButton];
    [self applyConstraintsSearchField];
}

-(void) applyConstraintsSearchView {
    [self.view addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@90);
    }];
}

-(void) applyConstraintsScrollView {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

-(void) applyConstraintsContentView {
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.equalTo(@500);
        //make.height.greaterThanOrEqualTo(self.scrollView);
    }];
}

- (void) applyConstraintsSearchField {
    [self.searchView addSubview:self.searchField];
    [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.equalTo(self.view).offset(kOffsetSide);
        make.right.equalTo(self.searchButton.mas_left).offset(-5);
    }];
}

- (void) applyConstraintssearchButton {
    [self.searchView addSubview:self.searchButton];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.right.equalTo(self.view).offset(-kOffsetSide);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
}

#pragma mark - private methods

- (void) startSearch {
    
    [self.searchButton setEnabled:NO];
    
    NSString *seachInput = [self.searchField text];
    NSString *searchInputFormated = [seachInput stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *baseURL = [NSURL URLWithString:kBaseURL];
    NSString *path = [NSString stringWithFormat: @"%@%@%@%@", kSites, kMLA, kSearch, searchInputFormated];
    
    [MeliService getProduct:(NSURL *)baseURL andResources: path andSuccesBlock:^(id response) {
        NSLog(@"Search for: %@, response%@",seachInput, response);
        [self.searchButton setEnabled:YES];
    }        andFailureBlock:^(NSError *error) {
        NSLog(@"Error in search Button: %@",error);
        [self popupErrorAlert];
    }];
}

-(void) popupErrorAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:kAlertErrorTitle message:kAlertErrorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:kAlertErrorAction style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.searchButton setEnabled:YES];
    }];
    [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
