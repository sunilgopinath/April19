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
        
        CGFloat w = 80;   //width in pixels of little view
		CGFloat h = 40;   //height in pixels of little view
		CGRect b = self.bounds;
        
		CGRect f = CGRectMake(
                              b.origin.x + (b.size.width - w) / 2,
                              b.origin.y + (b.size.height - h) / 2,
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
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        littleView.center = point;	//Move the littleView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
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
