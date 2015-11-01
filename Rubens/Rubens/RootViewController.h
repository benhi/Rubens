//
//  RootViewController.h
//  LeketIsrael
//
//  Created by Yoni & Hagit Colb on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MapViewController.h"
//#import "AboutViewController.h"
#import "DonateViewController.h"
#import "DonateFoodViewController.h"
#import "DonateMoneyViewController.h"

@interface RootViewController : UIViewController<UIActionSheetDelegate>
{
//    NSArray *listData;	
//    UITableView *myTableView;
//    MapViewController *mapController;
//    AboutViewController *aboutController;
////    DonateViewController *donateController;
	DonateWebViewController *donateWebController;
	DonateFoodViewController *donateFoodController;
	DonateMoneyViewController *donateMoneyController;
}

//@property (nonatomic, retain) NSArray *listData;
//@property (nonatomic, retain) IBOutlet UITableView *myTableView;
//@property (nonatomic, retain, readonly) MapViewController *mapController;
//@property (nonatomic, retain, readonly) AboutViewController *aboutController;
////@property (nonatomic, retain, readonly) DonateViewController *donateController;
@property (nonatomic, retain, readonly) DonateWebViewController *donateWebController;
@property (nonatomic, retain, readonly) DonateFoodViewController *donateFoodController;
@property (nonatomic, retain, readonly) DonateMoneyViewController *donateMoneyController;

-(IBAction)displayDonationWithActionSheet;

//-(IBAction)mapPressed;
//-(IBAction)donationPressed;
//-(IBAction)aboutPressed;

-(IBAction)mapPressed;
-(IBAction)aboutPressed;
@end
