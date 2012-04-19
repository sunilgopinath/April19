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
#import "TonyMaria.h"
#import "Introduction.h"

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
                 [[Introduction alloc] initWithFrame: self.bounds],
                 [[TonyMaria alloc] initWithFrame: self.bounds],
                 [[PuertoRico alloc] initWithFrame: self.bounds],
                 [[America alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	//Puerto Rico is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
        //tonyMariaView = [[TonyMaria alloc] initWithFrame: self.bounds];
        
        //[self addSubview: tonyMariaView];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
	}
	return self;
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	//CGPoint p = [recognizer locationInView: self];
    	//NSString *direction = @"unknown";
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		NSLog(@"→");
        	//toggle the index
        NSUInteger newIndex = index;
        if(index < views.count-1) {
            newIndex++;
        } else {
            newIndex = 0;
        }
        NSLog(@"index is %i and newIndex is %i", index, newIndex);
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
        if(index < views.count-1) {
            index++;
        } else {
            index = 0;
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		NSLog(@"←");
        NSUInteger newIndex = index;
        if(index > 1) {
            newIndex--;
        } else {
            newIndex = 3;
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		NSLog(@"↑");
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: 0]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
        if(index > 1) {
            
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		NSLog(@"↓");
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: views.count-1]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
	}
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {

 }
*/
@end
