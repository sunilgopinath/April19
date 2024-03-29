//
//  America.m
//  April19
//
//  Created by Sunil Gopinath on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "America.h"

@implementation America

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        NSString *text = @"Womb to tomb! ";
        
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/7];
        CGSize size = [text sizeWithFont: font];
        
        CGRect f = CGRectMake(
                              b.size.width,
                              0,
                              size.width,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [self addSubview: label];
        
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//seven red stripes
	CGContextBeginPath(c);
    for(int i = 0; i < 13; i+=2) {
        	CGContextAddRect(c, CGRectMake( i * w / 13, 0, w / 13, h));
    }
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    
    //The actor George C. Scott played General George S. Patton (1970).
	UIImage *image = [UIImage imageNamed: @"50stars.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
    
    //[image drawInRect:CGRectMake(w-image.size.width,0,image.size.width,image.size.height)];
	//[image drawAtPoint: point];
    UIImage * portraitImage = [[UIImage alloc] initWithCGImage: image.CGImage
                                                         scale: 1.0
                                                   orientation: UIImageOrientationLeft];
    [portraitImage drawInRect:CGRectMake(6*w/13,0,image.size.height,image.size.height)];
    
    //The actor George C. Scott played General George S. Patton (1970).
	UIImage *riff = [UIImage imageNamed: @"riff.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
    
	//upper left corner of image
	CGPoint point = CGPointMake(
                                (w - riff.size.width) / 2,
                                h - riff.size.height - 20
                                );
    
	[riff drawAtPoint: point];
    
    
    // animate the label
    // Drawing code
    [UIView animateWithDuration: 10
                          delay: 5
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         label.center = CGPointMake(
                                                    -label.bounds.size.width / 2,
                                                    self.bounds.size.height / 2
                                                    );
                         label.alpha = 0.0;
                     }
                     completion: NULL
     ];
    

}


@end
