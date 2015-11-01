//
//  DonateFoodViewController.h
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DonateMoneyViewController : UIViewController <UIWebViewDelegate>
{
	IBOutlet UIWebView *myWebView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	
	
}


@property (nonatomic, retain) UIWebView *myWebView;

@end
