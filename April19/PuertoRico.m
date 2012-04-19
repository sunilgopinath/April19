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
        
        
        NSString *textBernardo = @"I'd like to go back to San Juan. ";
        
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/9];
        CGSize size = [textBernardo sizeWithFont: font];
        
        CGRect f = CGRectMake(
                              b.size.width,
                              0,
                              size.width,
                              size.height
                              );
        
        bernardo = [[UILabel alloc] initWithFrame: f];
        bernardo.font = font;
        bernardo.backgroundColor = [UIColor clearColor];
        bernardo.textColor = [UIColor whiteColor];
        bernardo.text = textBernardo;
        [self addSubview: bernardo];
        
        NSString *textAnita = @"I know a boat you can get on! ";
        CGRect fAnita = CGRectMake(
                              -b.origin.x/2,
                              b.origin.y,
                              size.width,
                              size.height
                              );
        
        anita = [[UILabel alloc] initWithFrame: fAnita];
        UIFont *fontAnita = [UIFont italicSystemFontOfSize: b.size.height/18];
        anita.font = fontAnita;
        anita.backgroundColor = [UIColor clearColor];
        anita.textColor = [UIColor whiteColor];
        anita.text = textAnita;
        anita.alpha = 0.0;
        [self addSubview: anita];
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
	UIImage *image = [UIImage imageNamed: @"bernardo.jpg"];	//100 by 100
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
    
    // Drawing code
    [UIView animateWithDuration: 12
                          delay: 5
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         bernardo.center = CGPointMake(
                                                    -bernardo.bounds.size.width / 2,
                                                    self.bounds.size.height / 2
                                                    );
                     }
                     completion: NULL
     ];
    
    // Drawing code
    [UIView animateWithDuration: 12
                          delay: 19
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         anita.center = CGPointMake(
                                                       anita.bounds.size.width /2,
                                                       self.bounds.size.height / 2
                                                       );
                         anita.alpha = 1.0;
                     }
                     completion: NULL
     ];
}


@end
