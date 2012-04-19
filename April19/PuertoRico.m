//
//  LittleView.m
//  April19
//
//  Created by Sunil Gopinath on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PuertoRico.h"


@implementation PuertoRico

- (id) initWithFrame: (CGRect)frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//seven red stripes
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake( 0 * w / 5, 0, w / 5, h));
	CGContextAddRect(c, CGRectMake( 2 * w / 5, 0, w / 5, h));
	CGContextAddRect(c, CGRectMake( 4 * w / 5, 0, w / 5, h));
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    
	//blue union jack
	//CGContextBeginPath(c);
	//CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	//CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	//CGContextFillPath(c);
    
    CGContextMoveToPoint(c, 0, 0);
    CGContextAddLineToPoint(c, w/2, h/3);
    CGContextAddLineToPoint(c, w, 0);
	CGContextClosePath(c);                  //back to starting point
    
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
    
	//White star has 5 vertices (points).
	CGPoint center = CGPointMake(w/2, h/7); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);
    
	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
                         center.x + radius * cosf(theta),
                         center.y - radius * sinf(theta)
                         );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);
    
    //The actor George C. Scott played General George S. Patton (1970).
	UIImage *image = [UIImage imageNamed: @"rita1.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
    
	//upper left corner of image
	CGPoint point = CGPointMake(
                                (w - image.size.width) / 2,
                                h - image.size.height - 20
                                );
    
	[image drawAtPoint: point];
}


@end
