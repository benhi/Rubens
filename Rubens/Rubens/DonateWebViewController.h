//
//  DonateWebViewController.h
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonateWebViewController : UIViewController <UIWebViewDelegate>
{
	IBOutlet UIWebView *myWebView;
	IBOutlet UIActivityIndicatorView *activityIndicator;


}


@property (nonatomic, retain) UIWebView *myWebView;

@end
