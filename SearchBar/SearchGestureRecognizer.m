//
//  SearchGestureRecognizer.m
//  SearchBar
//
//  Created by Start on 2016/11/30.
//  Copyright © 2016年 Start. All rights reserved.
//

#import "SearchGestureRecognizer.h"

@implementation SearchGestureRecognizer
- (instancetype)init
{
    if (self = [super init]) {
        self.cancelsTouchesInView = false;
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchDelegate touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchDelegate touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchDelegate touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchDelegate touchesEnded:touches withEvent:event];
}
@end
