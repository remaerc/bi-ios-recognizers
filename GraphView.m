//
//  GraphView.m
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

-(instancetype)initWithFrame:(CGRect)frame defaultAmp:(double)defaultAmp{
    self = [super initWithFrame:frame];
    if (self) {
        self.amp = defaultAmp;
        self.opaque = NO;
    }
    return self;
}

@synthesize amp = _amp;

- (void)setAmp:(double)amp {
    _amp = amp;
    [self setNeedsDisplay];
}

@synthesize color = _color;

- (void)setColor:(UIColor *)color{
    _color = color;
    [self setNeedsDisplay];
}
- (UIColor*)color{
    if(!_color) _color = [UIColor redColor];
    return _color;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetLineWidth(context, 1);
    
    CGContextMoveToPoint(context, 0, CGRectGetHeight(self.bounds) / 2.0);
    for (double i = 0; i < CGRectGetWidth(self.bounds); i += 6) {
        
        CGFloat y = self.amp * 20 * sinf(i) + CGRectGetHeight(self.bounds) / 2.0;
        CGContextAddLineToPoint(context, i, y);
    }
    
    CGContextStrokePath(context);
}


@end
