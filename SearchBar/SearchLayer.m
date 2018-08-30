//
//  SearchLayer.m
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import "SearchLayer.h"
#import "SearchGestureRecognizer.h"
#import "SearchBar.h"
@interface SearchLayer ()<SearchGestureRecognizerDelegate>
@property (nonatomic, strong) SearchBar                   *searchBar;
@property (nonatomic, strong) CAShapeLayer                *roundedRectShape;
@property (nonatomic, strong) CAShapeLayer                *leftLineShape;
@property (nonatomic, strong) CAShapeLayer                *rightLineShape;
@property (nonatomic, assign) CGFloat                     searchBarHandleHeight;
@end
@implementation SearchLayer

- (instancetype)initWithSuperView:(UIView *)view {
    if(self = [super init]){
        _searchBar = (SearchBar *)view;
        self.frame = _searchBar.bounds;
        
        SearchGestureRecognizer *recognizer = [[SearchGestureRecognizer alloc]init];
        recognizer.searchDelegate = self;
        [_searchBar addGestureRecognizer:recognizer];
        
        _searchBarStretchWidth = 200;
        _searchBarStretchDirection = SearchBarStretchLeft;
        _searchBarEdgeColor = BlackColor;
        _searchBarBackgroundColor = ClearColor;
        [self initContents];
    }
    return self;
}
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchWidth:(CGFloat)width{
    if(self = [super init]){
        _searchBar = (SearchBar *)view;
        self.frame = _searchBar.bounds;
        
        SearchGestureRecognizer *recognizer = [[SearchGestureRecognizer alloc]init];
        recognizer.searchDelegate = self;
        [_searchBar addGestureRecognizer:recognizer];
        
        _searchBarStretchWidth = width;
        _searchBarStretchDirection = SearchBarStretchLeft;
        _searchBarEdgeColor = BlackColor;
        
        [self initContents];
    }
    return self;
}
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchDirection:(SearchBarStretchDirection)direction{
    if(self = [super init]){
        _searchBar = (SearchBar *)view;
        self.frame = _searchBar.bounds;
        
        SearchGestureRecognizer *recognizer = [[SearchGestureRecognizer alloc]init];
        recognizer.searchDelegate = self;
        [_searchBar addGestureRecognizer:recognizer];
        
        _searchBarStretchWidth = 200;
        _searchBarStretchDirection = direction;
        _searchBarEdgeColor = BlackColor;
        
        [self initContents];
    }
    return self;
}
- (instancetype)initWithSuperView:(UIView *)view searchBarEdgeColor:(UIColor *)color{
    if(self = [super init]){
        _searchBar = (SearchBar *)view;
        self.frame = _searchBar.bounds;
        
        SearchGestureRecognizer *recognizer = [[SearchGestureRecognizer alloc]init];
        recognizer.searchDelegate = self;
        [_searchBar addGestureRecognizer:recognizer];
        
        _searchBarStretchWidth = 200;
        _searchBarStretchDirection = SearchBarStretchLeft;
        _searchBarEdgeColor = color;
        
        [self initContents];
    }
    return self;
}
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchWidth:(CGFloat)width searchBarStretchDirection:(SearchBarStretchDirection)direction searchBarEdgeColor:(UIColor *)color{
    if(self = [super init]){
        _searchBar = (SearchBar *)view;
        self.frame = _searchBar.bounds;
        
        SearchGestureRecognizer *recognizer = [[SearchGestureRecognizer alloc]init];
        recognizer.searchDelegate = self;
        [_searchBar addGestureRecognizer:recognizer];
        
        _searchBarStretchWidth = width;
        _searchBarStretchDirection = direction;
        _searchBarEdgeColor = color;
        
        [self initContents];
    }
    return self;
}
- (void)initContents {
    
    _isStretch = NO;
    _searchBarHandleHeight = UIViewHeight(self)/2*cos(M_PI/4);
    
    _roundedRectShape = [CAShapeLayer layer];
    _roundedRectShape.opacity = 1.0;
    _roundedRectShape.frame = self.bounds;
    _roundedRectShape.borderColor = _searchBarEdgeColor.CGColor;
    _roundedRectShape.borderWidth = 2.0;
    _roundedRectShape.cornerRadius = UIViewWidth(_roundedRectShape)/2;
    _roundedRectShape.backgroundColor = _searchBarBackgroundColor.CGColor;
    [self addSublayer:_roundedRectShape];
    
    _leftLineShape = [CAShapeLayer layer];
    _leftLineShape.fillColor = _searchBarEdgeColor.CGColor;
    _leftLineShape.lineWidth = 1;
    _leftLineShape.opacity = 1.0;
    _leftLineShape.frame = CGRectMake(UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), 1, _searchBarHandleHeight);
    UIBezierPath *leftPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2, _searchBarHandleHeight) cornerRadius:0.0];
    CGFloat leftPathDegreeToRotate = -M_PI/4;
    CGAffineTransform leftPathTransform = CGAffineTransformMakeRotation(leftPathDegreeToRotate);
    [leftPath applyTransform:leftPathTransform];
    _leftLineShape.path = leftPath.CGPath;
    [self addSublayer:_leftLineShape];
    
    _rightLineShape = [CAShapeLayer layer];
    _rightLineShape.fillColor = _searchBarEdgeColor.CGColor;
    _rightLineShape.lineWidth = 2;
    _rightLineShape.opacity = 1.0;
    _rightLineShape.frame = CGRectMake(UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), UIViewHeight(self)/2-UIViewHeight(self)/2*cos(M_PI/4), 1, _searchBarHandleHeight);
    UIBezierPath *rightPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2, _searchBarHandleHeight) cornerRadius:0.0];
    CGFloat rightDegreeToRotate = -M_PI*3/4;
    CGAffineTransform rightTransform = CGAffineTransformMakeRotation(rightDegreeToRotate);
    [rightPath applyTransform:rightTransform];
    _rightLineShape.path = rightPath.CGPath;
    [_rightLineShape setHidden:YES];
    [self addSublayer:_rightLineShape];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:_searchBar];
    
    if(_isStretch&&![self inSearchBarClose:location]){
        return;
    }
    _isStretch = !_isStretch;
    if(_isStretch){
        [self stretchSearchBarAnimation];
    }else{
        [self foldSearchBarAnimation];
    }
}
-(void)stretchSearchBarAnimation {
    if(_searchBarStretchDirection == SearchBarStretchLeft){
        [UIView animateWithDuration:0.25 animations:^{
            self.searchBar.frame = CGRectMake(UIViewX(self.searchBar)-(self.searchBarStretchWidth-UIViewHeight(self.searchBar)), UIViewY(self.searchBar), self.searchBarStretchWidth, UIViewHeight(self.searchBar));
        }completion:^(BOOL finished){
            [self.rightLineShape setHidden:NO];
            [self fitFrameSize];
            [self setSearchTextFieldFirstResponder];
        }];
    }else{
        [_rightLineShape setHidden:NO];
        _searchBar.frame = CGRectMake(UIViewX(_searchBar), UIViewY(_searchBar), _searchBarStretchWidth, UIViewHeight(_searchBar));
        [self fitFrameSize];
        [self setSearchTextFieldFirstResponder];
    }
}
-(void)foldSearchBarAnimation {
    [self setSearchTextFieldFirstResponder];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [_rightLineShape setHidden:YES];
    [CATransaction commit];
    if(_searchBarStretchDirection == SearchBarStretchLeft){
        [CATransaction begin];
        [CATransaction setAnimationDuration:0.1];
        [CATransaction setCompletionBlock:^{
            [UIView animateWithDuration:0.1 animations:^{
                self.searchBar.frame = CGRectMake(UIViewX(self.searchBar)+(self.searchBarStretchWidth-UIViewHeight(self.searchBar)), UIViewY(self.searchBar), UIViewHeight(self.searchBar), UIViewHeight(self.searchBar));
                [self fitFrameSize];
            }];
        }];
        _searchBar.frame = CGRectMake(UIViewX(_searchBar), UIViewY(_searchBar), UIViewHeight(_searchBar), UIViewHeight(_searchBar));
        [self fitFrameSize];
        [CATransaction commit];
    }else{
        _searchBar.frame = CGRectMake(UIViewX(_searchBar), UIViewY(_searchBar), UIViewHeight(_searchBar), UIViewHeight(_searchBar));
        [self fitFrameSize];
    }
}
-(void)setSearchTextFieldFirstResponder {
    if(_isStretch){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.searchBar.searchBarTextField setHidden:NO];
            if([self.searchBar.placeholder isEqualToString:@""]){
                [self.searchBar.searchBarTextField becomeFirstResponder];
            }else{
                [UIView animateWithDuration:0.25 animations:^{
                    self.searchBar.searchBarTextField.alpha = 1.0;
                }];
            }
        });
    }else{
        _searchBar.searchBarTextField.alpha = 0.0;
        _searchBar.searchBarTextField.text = @"";
        [_searchBar.searchBarTextField resignFirstResponder];
        [_searchBar.searchBarTextField setHidden:YES];
    }
}
-(BOOL)inSearchBarClose:(CGPoint)location {
    return CGRectContainsPoint(_searchBar.searchBarClose.frame, location);
}
-(void)fitFrameSize {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    self.frame = _searchBar.bounds;
    _roundedRectShape.frame = self.bounds;
    _searchBar.searchBarTextField.frame = CGRectMake(UIViewX(self)+UIViewHeight(self)/2,UIViewY(self),UIViewWidth(self)-UIViewHeight(self)*3/2,UIViewHeight(self));
    _searchBar.searchBarClose.frame = CGRectMake(UIViewMaxX(self)-UIViewWidth(_searchBar.searchBarClose), UIViewMaxY(self)-UIViewHeight(_searchBar.searchBarClose), UIViewWidth(_searchBar.searchBarClose), UIViewHeight(_searchBar.searchBarClose));
    if(_isStretch){
        _leftLineShape.frame = CGRectMake(UIViewHeight(self)/2-_searchBarHandleHeight/2*cos(M_PI/4)+UIViewWidth(self)-UIViewHeight(self), UIViewHeight(self)/2-_searchBarHandleHeight/2*cos(M_PI/4)+1, 1, _searchBarHandleHeight);
        _rightLineShape.frame = CGRectMake(UIViewHeight(self)/2-_searchBarHandleHeight/2*cos(M_PI/4)+1+UIViewWidth(self)-UIViewHeight(self), UIViewHeight(self)/2+_searchBarHandleHeight/2*cos(M_PI/4)+1, 1, _searchBarHandleHeight);
    }else{
        _leftLineShape.frame = CGRectMake(UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), 1, _searchBarHandleHeight);
        _rightLineShape.frame = CGRectMake(UIViewHeight(self)/2+UIViewHeight(self)/2*cos(M_PI/4), UIViewHeight(self)/2-UIViewHeight(self)/2*cos(M_PI/4), 1, _searchBarHandleHeight);
    }
    [CATransaction commit];
}
-(void)setRoundRectShapeBackgroundColor:(UIColor *)backgroundColor {
    _roundedRectShape.backgroundColor = backgroundColor.CGColor;
}
@end
