//
//  AboutViewController.h
//  LeketIsrael
//
//  Created by Yoni & Hagit Colb on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class MyScrollView;

@interface AboutViewController : UIViewController <MFMailComposeViewControllerDelegate> {
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIButton * myButton;
    
}
@property (nonatomic, retain) UIView *scrollView;


-(IBAction)contactPressed;

@end
