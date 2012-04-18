//
//  View.m
//  April19
//
//  Created by Sunil Gopinath on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "LittleView.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        //Put the origin at the center of the big view.
		CGRect b = self.bounds;
        
		self.bounds = CGRectMake(
                                 -b.size.width / 2,
                                 -b.size.height / 2,
                                 b.size.width,
                                 b.size.height
                                 );
        
		//Put the LittleView at the origin of the big view.
		CGFloat w = 80;   //width in pixels of LittleView
		CGFloat h = 40;   //height in pixels of LittleView
        
		CGRect f = CGRectMake(
                              -w / 2,
                              -h / 2,
                              w,
                              h
                              );
        littleView = [[LittleView alloc] initWithFrame: f];
        [self addSubview: littleView];
    }
    return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        
		[UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             [UIView setAnimationRepeatCount: 2];
                             littleView.center = [[touches anyObject] locationInView: self];
                         }
                         completion: NULL
         ];
	}
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */
@end
