//
//  DonateViewController.h
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DonateWebViewController.h"


@interface DonateViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> 
{
    NSArray *array;
    NSArray *listData;	
    UITableView *myTableView;
	DonateWebViewController *donateWebController;
}


@property (nonatomic, retain) NSArray *listData;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain, readonly) DonateWebViewController *donateWebController;

@end
