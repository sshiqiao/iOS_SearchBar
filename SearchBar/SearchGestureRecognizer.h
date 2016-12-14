//
//  SearchGestureRecognizer.h
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
@protocol SearchGestureRecognizerDelegate <NSObject>
@optional
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
@interface SearchGestureRecognizer : UIGestureRecognizer
@property (nonatomic, weak) id<SearchGestureRecognizerDelegate> searchDelegate;
@end
