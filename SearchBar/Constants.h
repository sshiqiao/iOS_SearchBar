//
//  Constants.h
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define UIViewX(control) (control.frame.origin.x)
#define UIViewY(control) (control.frame.origin.y)


#define UIViewWidth(view) CGRectGetWidth(view.frame)
#define UIViewHeight(view) CGRectGetHeight(view.frame)

#define UIViewMaxX(view) CGRectGetMaxX(view.frame)
#define UIViewMaxY(view) CGRectGetMaxY(view.frame)

#define UIViewMinX(view) CGRectGetMinX(view.frame)
#define UIViewMinY(view) CGRectGetMinY(view.frame)

#define UIViewMidX(view) CGRectGetMidX(view.frame)
#define UIViewMidY(view) CGRectGetMidY(view.frame)

#define RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

#define parkLightColor  UIColorFromRGB(0x16dad5)

#define alphaDarkColor [UIColor colorWithRed:0.0 / 255.0 green:0.0 / 255.0 blue:0.0 / 255.0 alpha:0.87]

#define ColorThemeRed RGBA(241.0, 47.0, 84.0, 1.0)
#define ClearColor [UIColor clearColor]
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define GrayColor [UIColor grayColor]

#endif /* Constants_h */
