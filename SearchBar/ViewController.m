//
//  ViewController.m
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import "ViewController.h"
#import "SearchBar.h"
#import "Constants.h"
@interface ViewController () <SearchBarDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //初始化SearchBar 位置大小、searchBarStretchWidth展开宽度
    SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 50, 50, 50) searchBarStretchWidth:330];
    searchBar.placeholder = @"default searchBar";
    [searchBar.searchBarTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    
    //初始化SearchBar 位置大小、searchBarEdgeColor边框颜色
    SearchBar *searchBar1 = [[SearchBar alloc]initWithFrame:CGRectMake(40, 150, 30, 30) searchBarEdgeColor:GrayColor];
    //设置展开方向
    [searchBar1 setSearchBarStretchDirection:1];
    searchBar1.placeholder = @"custom searchBar";
    [searchBar1.searchBarTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    searchBar1.delegate = self;
    [self.view addSubview:searchBar1];
    
    
    
    SearchBar *searchBar2 = [[SearchBar alloc]initWithFrame:CGRectMake(40, 230, 30, 30) searchBarEdgeColor:ColorThemeRed];
    [searchBar2 setSearchBarStretchDirection:1];
    searchBar2.placeholder = @"custom searchBar";
    [searchBar2.searchBarTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    searchBar2.delegate = self;
    [self.view addSubview:searchBar2];
    
}

#pragma searchBar textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"textFieldDidChange");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

@end
