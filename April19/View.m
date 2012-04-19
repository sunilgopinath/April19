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
        
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        CGRect f = CGRectMake(0, 0, 80, 40);
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
                                        | UIViewAnimationOptionAllowUserInteraction
                                        | UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             //This block describes what the animation should do.
                             CGPoint p = [[touches anyObject] locationInView: self];
                             CGFloat h = self.bounds.size.height;
                             
                             littleView.backgroundColor = [UIColor
                                                           colorWithRed: 0.0
                                                           green: p.y / h		//green near the bottom
                                                           blue: (h - p.y) / h	//blue near the top
                                                           alpha: 1.0
                                                           ];
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
