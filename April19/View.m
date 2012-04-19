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
        self.backgroundColor = [UIColor blueColor];
        
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
        //[self addSubview: littleView];
        
        NSString *america = @"America";
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/5];
        CGSize size = [america sizeWithFont: font];

        
        CGRect f1 = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              size.width,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f1];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = america;
        [self addSubview: label];
        
        
        NSString *puertoRico = @"Puerto Rico ";
        UIFont *fontPuertoRico = [UIFont italicSystemFontOfSize: b.size.height/5];
        CGSize sizePuertoRico = [puertoRico sizeWithFont: fontPuertoRico];
        
        CGRect f2 = CGRectMake(
                               self.bounds.origin.x,
                               self.bounds.origin.y/2,
                               sizePuertoRico.width,
                               sizePuertoRico.height
                               );
        
        label2 = [[UILabel alloc] initWithFrame: f2];
        label2.font = font;
        label2.backgroundColor = [UIColor clearColor];
        label2.textColor = [UIColor redColor];
        label2.text = puertoRico;
        [self addSubview: label2];
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
                             littleView.center = [[touches anyObject] locationInView: self];
                             littleView.backgroundColor = [UIColor greenColor];
                             //littleView.transform = CGAffineTransformMakeScale(1, 2);

                         }
                         completion: NULL
         ];
	}
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}


 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
     // Drawing code
     [UIView animateWithDuration: 25
                           delay: 10.75
                         options: UIViewAnimationOptionCurveLinear
                      animations: ^{
                          //Move the label far enough to the left
                          //so that it's out of the View.
                          label.center = CGPointMake(
                                                     -label.bounds.size.width / 2,
                                                     self.bounds.size.height / 2
                                                     );
                          label.alpha = 0.0;	//0.0 is transparent, 1.0 is opaque
                          label2.center = CGPointMake(
                                                     -label2.bounds.size.width / 2,
                                                     self.bounds.size.height / 2
                                                     );
                          label2.alpha = 0.0;

                      }
                      completion: NULL
      ];
 }

@end
