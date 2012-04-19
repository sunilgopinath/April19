//
//  Introduction.m
//  April19
//
//  Created by Sunil Gopinath on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Introduction.h"

@implementation Introduction

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		textView = [[UITextView alloc] initWithFrame: self.bounds];
		textView.textColor = [UIColor whiteColor];
        textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"introductionbackground.jpg"]];
		textView.font = [UIFont fontWithName: @"Georgia" size: 12];
		textView.editable = NO;	//Don't pop up a keyboard.
		NSString *fullpath = [[NSBundle mainBundle] pathForResource:@"romeo" ofType:@"txt"];  
        if (fullpath) {  
            NSString *contents = [NSString stringWithContentsOfFile:fullpath encoding:NSUTF8StringEncoding error:nil];[NSString stringWithContentsOfFile:fullpath encoding:NSUTF8StringEncoding error:nil];
            if (contents) {  
                textView.text= contents;  
            }  
        } else {
            NSLog(@"filepath not found");
        }       
		[self addSubview: textView];
        
        
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
