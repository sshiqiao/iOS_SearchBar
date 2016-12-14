//
//  SearchBar.m
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import "SearchBar.h"
@interface SearchBar()<UITextFieldDelegate>
@end

@implementation SearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _searchLayer = [[SearchLayer alloc]initWithSuperView:self];
        [self.layer addSublayer:_searchLayer];
        
        _searchBarTextField = [[UITextField alloc]init];
        _searchBarTextField.frame = self.bounds;
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField setHidden:YES];
        _searchBarTextField.alpha = 0.0;
        _searchBarTextField.returnKeyType=UIReturnKeySearch;
        [self addSubview:_searchBarTextField];
        
        _searchBarClose = [[UIImageView alloc]init];
        _searchBarClose.frame = self.bounds;
        [self addSubview:_searchBarClose];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchWidth:(CGFloat)width{
    if(self = [super initWithFrame:frame]){
        _searchLayer = [[SearchLayer alloc]initWithSuperView:self searchBarStretchDirection:width];
        [self.layer addSublayer:_searchLayer];
        
        _searchBarTextField = [[UITextField alloc]init];
        _searchBarTextField.frame = self.bounds;
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField setHidden:YES];
        _searchBarTextField.returnKeyType=UIReturnKeySearch;
        [self addSubview:_searchBarTextField];
        
        _searchBarClose = [[UIImageView alloc]init];
        _searchBarClose.frame = self.bounds;
        [self addSubview:_searchBarClose];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchDirection:(SearchBarStretchDirection)direction{
    if(self = [super initWithFrame:frame]){
        _searchLayer = [[SearchLayer alloc]initWithSuperView:self searchBarStretchDirection:direction];
        [self.layer addSublayer:_searchLayer];
        
        _searchBarTextField = [[UITextField alloc]init];
        _searchBarTextField.frame = self.bounds;
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField setHidden:YES];
        _searchBarTextField.returnKeyType=UIReturnKeySearch;
        [self addSubview:_searchBarTextField];
        
        _searchBarClose = [[UIImageView alloc]init];
        _searchBarClose.frame = self.bounds;
        [self addSubview:_searchBarClose];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame searchBarEdgeColor:(UIColor *)color{
    if(self = [super initWithFrame:frame]){
        _searchLayer = [[SearchLayer alloc]initWithSuperView:self searchBarEdgeColor:color];
        [self.layer addSublayer:_searchLayer];
        
        _searchBarTextField = [[UITextField alloc]init];
        _searchBarTextField.frame = self.bounds;
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField setHidden:YES];
        _searchBarTextField.returnKeyType=UIReturnKeySearch;
        [self addSubview:_searchBarTextField];
        
        _searchBarClose = [[UIImageView alloc]init];
        _searchBarClose.frame = self.bounds;
        [self addSubview:_searchBarClose];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame searchBarStretchWidth:(CGFloat)width searchBarStretchDirection:(SearchBarStretchDirection)direction searchBarEdgeColor:(UIColor *)color {
    if(self = [super initWithFrame:frame]){
        _searchLayer = [[SearchLayer alloc]initWithSuperView:self searchBarStretchWidth:width searchBarStretchDirection:direction searchBarEdgeColor:color];
        [self.layer addSublayer:_searchLayer];
        
        _searchBarTextField = [[UITextField alloc]init];
        _searchBarTextField.frame = self.bounds;
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField setHidden:YES];
        _searchBarTextField.returnKeyType=UIReturnKeySearch;
        [self addSubview:_searchBarTextField];
        
        _searchBarClose = [[UIImageView alloc]init];
        _searchBarClose.frame = self.bounds;
        [self addSubview:_searchBarClose];
    }
    return self;
}

#pragma set view properties
- (void)setSearchBarStretchDirection:(SearchBarStretchDirection)searchBarStretchDirection {
    _searchLayer.searchBarStretchDirection = searchBarStretchDirection;
}
- (NSString *)text {
    return _searchBarTextField.text;
}
- (void)setText:(NSString *)text {
    _searchBarTextField.text = text;
}
- (NSString *)placeholder {
    return _searchBarTextField.placeholder;
}
- (void)setPlaceholder:(NSString *)placeholder {
    _searchBarTextField.placeholder = placeholder;
}
- (UIFont *)font {
    return _searchBarTextField.font;
}
- (void)setFont:(UIFont *)font {
    _searchBarTextField.font = font;
}
- (UIColor *)textColor {
    return _searchBarTextField.textColor;
}
- (void)setTextColor:(UIColor *)textColor {
    _searchBarTextField.textColor = textColor;
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:_searchBarTextField.placeholder attributes: [NSDictionary dictionaryWithObject: placeholderColor forKey: NSForegroundColorAttributeName]];
    [_searchBarTextField setAttributedPlaceholder:placeholder];
}
- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    _searchBarTextField.secureTextEntry = secureTextEntry;
}
- (void)setHintColor:(UIColor *)tintColor {
    _searchBarTextField.tintColor = tintColor;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [_searchLayer setRoundRectShapeBackgroundColor:backgroundColor];
}
#pragma searchBar textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        [_delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [_delegate textFieldDidBeginEditing:textField];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        [_delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [_delegate textFieldDidEndEditing:textField];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]){
        [_delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if([_delegate respondsToSelector:@selector(textFieldShouldClear:)]){
        [_delegate textFieldShouldClear:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        _searchLayer.isStretch = !_searchLayer.isStretch;
        [_searchLayer foldSearchBarAnimation];
        return [_delegate textFieldShouldReturn:textField];
    }
    return NO;
}
@end
