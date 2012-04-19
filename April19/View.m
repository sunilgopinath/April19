//
//  View.m
//  April19
//
//  Created by Sunil Gopinath on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "PuertoRico.h"
#import "America.h"

@implementation View


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        
		//Don't bother with a background color--
		//this BigView is entirely occupied by a LittleView.
		self.window.backgroundColor = [UIColor whiteColor];
		views = [NSArray arrayWithObjects:
                 [[PuertoRico alloc] initWithFrame: self.bounds],
                 [[America alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	//Puerto Rico is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    
	NSUInteger newIndex = 1 - index;	//toggle the index
    
	[UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
	index = newIndex;
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {

 }
*/
@end
