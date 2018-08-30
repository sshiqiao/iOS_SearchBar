//
//  SearchBar.h
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchLayer.h"
@protocol SearchBarDelegate <NSObject>
@optional
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)textFieldShouldClear:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end

@interface SearchBar : UIView

@property (nonatomic, weak) id<SearchBarDelegate> delegate;

@property (nonatomic, strong) SearchLayer *searchLayer;
@property (nonatomic, strong) UITextField *searchBarTextField;
@property (nonatomic, strong) UIImageView *searchBarClose;

- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchWidth:(CGFloat)width;
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchDirection:(SearchBarStretchDirection)direction;
- (instancetype)initWithFrame:(CGRect)frame searchBarEdgeColor:(UIColor *)color;
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchWidth:(CGFloat)width searchBarStretchDirection:(SearchBarStretchDirection)direction searchBarEdgeColor:(UIColor *)color;
- (void)setSearchBarStretchDirection:(SearchBarStretchDirection)searchBarStretchDirection;
- (NSString *)text;
- (void)setText:(NSString *)text;
- (NSString *)placeholder;
- (void)setPlaceholder:(NSString *)placeholder;
- (UIFont *)font;
- (void)setFont:(UIFont *)font;
- (UIColor *)textColor;
- (void)setTextColor:(UIColor *)textColor;
- (void)setPlaceholderColor:(UIColor *)placeholderColor;
- (void)setSecureTextEntry:(BOOL)secureTextEntry;
- (void)setHintColor:(UIColor *)tintColor;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
@end
