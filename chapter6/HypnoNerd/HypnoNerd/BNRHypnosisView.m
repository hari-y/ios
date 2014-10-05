//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Hari  on 9/14/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRHypnosisView.h"
@interface BNRHypnosisView ()

@property (strong,nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        self.circleColor=[UIColor lightGrayColor];
        
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGRect bounds=self.window.bounds;
    CGPoint center;
    center.x=(bounds.origin.x+bounds.size.width)/2.0;
    center.y=(bounds.origin.y+bounds.size.height)/2.0;
    
    float maxRadius=hypot(bounds.size.width,bounds.size.height)/2.0;
    
    UIBezierPath *path=[[UIBezierPath alloc] init];
    
    for(float currentRadius=maxRadius;currentRadius>0;currentRadius-=20)
    {
        [path moveToPoint:CGPointMake(center.x+currentRadius,center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    }
    path.lineWidth=10;
    [self.circleColor setStroke];
    [path stroke];
    
    //bronze challenge //gold challenge shadowing
   

    
    //triangle with gradient
    CGContextRef currentContext=UIGraphicsGetCurrentContext();
    CGContextSaveGState( currentContext);//save context to restore afterwards
    
    CGContextSetAlpha(currentContext, 0.5);
    CGFloat locations[2]={0.0,1.0};
    CGFloat components[8]={0.0,1.0,0.0,1.0,1.0,1.0,0.0,1.0};
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    CGPoint firstPoint={150.0,100.0};
    CGPoint secondPoint={250.0,400.0};
    CGPoint thirdPoint={50.0,400.0};
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:firstPoint];
    [triangle addLineToPoint:secondPoint];
    [triangle addLineToPoint:thirdPoint];
    [triangle closePath];
    [triangle addClip];
    CGGradientRef gradient=CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    CGPoint startPoint = CGPointMake(150.0, 100.0);
    CGPoint endPoint = CGPointMake(250.0, 400.0);
    CGContextDrawLinearGradient(currentContext,gradient,startPoint, endPoint,kCGGradientDrawsBeforeStartLocation|kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(currentContext);
    //getting back to original state no impact for images that are drawn afterwards.
    //Please remeber you have to save to restore it

   CGContextSaveGState( currentContext);
    CGContextSetAlpha(currentContext, 1);
    CGContextSetShadow(currentContext,CGSizeMake(4,7),3);
    CGRect imageRect=CGRectMake(50, 140, 200, 200);
    UIImage *logoImage=[UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:imageRect];
    CGContextRestoreGState(currentContext);
    
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor=circleColor;
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)tocuhes withEvent:(UIEvent *)event
{
    NSLog(@"%@ was toudhed",self);
    
    float red=(arc4random()%100)/100.0;
    float green =(arc4random()%100)/100.0;
    float blue =(arc4random()%100)/100.0;
    
    UIColor *randomColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor=randomColor;
    
    
}
@end
