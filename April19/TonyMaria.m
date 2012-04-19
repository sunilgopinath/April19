//
//  TonyMaria.m
//  April19
//
//  Created by Sunil Gopinath on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TonyMaria.h"
#import "Maria.h"
#import "Tony.h"

@implementation TonyMaria

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"westsidestorybackground1.png"]];
        
        CGFloat w = self.bounds.size.width;
        CGFloat h = self.bounds.size.height;
        
        // ADD MARIA TO THE VIEW
        UIImage *maria = [UIImage imageNamed: @"maria.png"];
        CGRect fMaria = CGRectMake(0, 0, maria.size.width, maria.size.height);
        mariaView = [[Maria alloc] initWithFrame: fMaria];
        mariaView.backgroundColor = [UIColor colorWithPatternImage:maria];
        [self addSubview: mariaView];
        
        // ADD TONY TO THE VIEW
        UIImage *tony = [UIImage imageNamed: @"tony.png"];
        CGRect fTony = CGRectMake(w-tony.size.width, h-tony.size.height, tony.size.width, tony.size.height);
        tonyView = [[Tony alloc] initWithFrame: fTony];
        tonyView.backgroundColor = [UIColor colorWithPatternImage:tony];
        [self addSubview: tonyView];
        
        // ADD TEXT TO VIEW 
        //Trailing blank to avoid cutting off last letter
        //because italic leans to the right.
        NSString *text = @"HELP TONY AND MARIA";
        
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/2];
        CGSize size = [text sizeWithFont: font];
        
        CGRect t = CGRectMake(
                              b.size.width,
                              0,
                              size.width,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: t];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.text = text;
        [self addSubview: label];
        
        
    }
    return self;
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
       // mariaView.center = point;	//Move the mariaView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
        
        //tonyView.center = point;
        
        
        if ([touch view] == mariaView) {
            // move the image view
            mariaView.center = point;
        }
        else if ([touch view] == tonyView) {
            // move the image view
            tonyView.center = point;
        }
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
    // Drawing code
    [UIView animateWithDuration: 20
                          delay: 5
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         label.center = CGPointMake(
                                                    -label.bounds.size.width / 2,
                                                    self.bounds.size.height / 2
                                                    );
                     }
                     completion: NULL
     ];
}


@end
