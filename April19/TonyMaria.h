//
//  TonyMaria.h
//  April19
//
//  Created by Sunil Gopinath on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Maria;
@class Tony;

@interface TonyMaria : UIView {
    Maria *mariaView;
    Tony *tonyView;
    UILabel *label;
    // holds the long text
    UITextView *textView;
}


@end
