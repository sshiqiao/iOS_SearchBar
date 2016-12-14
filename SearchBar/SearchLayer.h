//
//  SearchLayer.h
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Constants.h"
typedef NS_ENUM(NSInteger, SearchBarStretchDirection)
{
    SearchBarStretchLeft,
    SearchBarStretchRight
};
@interface SearchLayer : CALayer
@property (nonatomic) BOOL                       isStretch;
@property (nonatomic) CGFloat                    searchBarStretchWidth;
@property (nonatomic) SearchBarStretchDirection  searchBarStretchDirection;
@property (nonatomic) UIColor                   *searchBarEdgeColor;
@property (nonatomic) UIColor                   *searchBarBackgroundColor;
- (instancetype)initWithSuperView:(UIView *)view;
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchWidth:(CGFloat)width;
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchDirection:(SearchBarStretchDirection)direction;
- (instancetype)initWithSuperView:(UIView *)view searchBarEdgeColor:(UIColor *)color;
- (instancetype)initWithSuperView:(UIView *)view searchBarStretchWidth:(CGFloat)width searchBarStretchDirection:(SearchBarStretchDirection)direction searchBarEdgeColor:(UIColor *)color;
-(void)stretchSearchBarAnimation;
-(void)foldSearchBarAnimation;
-(void)setRoundRectShapeBackgroundColor:(UIColor *)backgroundColor;
@end
