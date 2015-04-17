//
//  BNRPopoverBackgroundView.m
//  HomePwner
//
//  Created by Hari  on 4/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRPopoverBackgroundView.h"

@implementation BNRPopoverBackgroundView


@synthesize arrowDirection  = _arrowDirection;
@synthesize arrowOffset     = _arrowOffset;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.arrowDirection = UIPopoverArrowDirectionUp;
        self.arrowOffset = 20.0;
    }
    return self;
}



/*
- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{;
    
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
    return;
}

- (void)setArrowOffset:(CGFloat)arrowOffset
{
 
    _arrowOffset = arrowOffset;
    [self setNeedsLayout];
    return;
}*/

+ (CGFloat)arrowBase
{
    return 20.0f;
}

+ (CGFloat)arrowHeight
{
    return 0.0f;
}

+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(30.0,30.0,3.0,3.0);
}

+ (BOOL)wantsDefaultContentAppearance
{
    return YES;
}
@end
