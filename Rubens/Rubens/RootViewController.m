//
//  RootViewController.m
//  LeketIsrael
//
//  Created by Yoni & Hagit Colb on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MapViewController.h"
#import "DonateViewController.h"
#import "AboutViewController.h"
#import "DonateFoodViewController.h"
#import "DonateMoneyViewController.h"

@implementation RootViewController
//@synthesize myTableView;
//@synthesize listData;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSArray *tempArray = [[NSArray alloc]initWithObjects:@"Map",@"Donation",@"About",nil];
//    self.listData = tempArray;
//    [tempArray release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	self.title = @"Home";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
/*	
	//enlever la selection du Row	
	NSIndexPath *selectedIndexPath = [myTableView indexPathForSelectedRow];
	if (selectedIndexPath) 
		[myTableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
*/	
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
//	self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
/*
#pragma mark - #pragma mark Table View Data Source Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.listData count];
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section 
{ 
    return 1;
} 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil) 
    { cell = [[[UITableViewCell alloc]
               initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
    NSUInteger section = [indexPath section]; 
	cell.textLabel.text = [listData objectAtIndex:section]; 
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	tableView.backgroundColor = [UIColor clearColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) 
    {
        case 0:
            [self.navigationController pushViewController:self.mapController animated:YES];
            break;
            
        case 1:
			[self displayDonationWithActionSheet];
//            [self.navigationController pushViewController:self.donateController animated:YES];
            break;
            
        case 2:
            [self.navigationController pushViewController:self.aboutController animated:YES];
            break;
            
        default:
            break;
    }
	//deselectioner le row
	[myTableView deselectRowAtIndexPath:indexPath animated:YES];
}
*/

-(void)aboutPressed {
	AboutViewController *viewController = [[[AboutViewController alloc] init] autorelease];
	
	UINavigationController *navCon = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
	navCon.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	navCon.navigationBar.tintColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
	
	[self presentModalViewController:navCon animated:YES];
}

-(void)mapPressed {
	MapViewController *viewController = [[[MapViewController alloc] init] autorelease];
	
	UINavigationController *navCon = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
	navCon.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	navCon.navigationBar.tintColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
	[self presentModalViewController:navCon animated:YES];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
//    self.myTableView = nil;
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
	[donateWebController release];
	[donateFoodController release];
	[donateMoneyController release];
//	[myTableView release];
//  [listData release];
	[super dealloc];
}

-(IBAction)displayDonationWithActionSheet
{
	UIActionSheet *actionSheet =[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Donate Time",@"Donate Food",@"Donate Money", nil];
	[actionSheet showInView:self.view];
	actionSheet.delegate=self;
	[actionSheet release];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex 
{
	switch (buttonIndex) 
    {
        case 0:
            [self.navigationController pushViewController:self.donateWebController animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:self.donateFoodController animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:self.donateMoneyController animated:YES];
            break;
        default:
            break;
    }
}
/*
// The lazy-loading "getter" for mapController.
- (MapViewController *)mapController {
    if (mapController == nil) {
        mapController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    }
    return mapController;
}
*/
/*
// The lazy-loading "getter" for donateController.
- (DonateViewController *)donateController {
    if (donateController == nil) {
        donateController = [[DonateViewController alloc] initWithNibName:@"DonateViewController" bundle:nil];
    }
	
    return donateController;
}
*/
/*
// The lazy-loading "getter" for aboutController.
- (AboutViewController *)aboutController {
    if (aboutController == nil) {
        aboutController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    }
	
    return aboutController;
}
*/
- (DonateWebViewController *)donateWebController 
{
    if (donateWebController == nil) 
	{
        donateWebController = [[DonateWebViewController alloc] initWithNibName:@"DonateWebViewController" bundle:nil];
    }
	
    return donateWebController;
}

- (DonateFoodViewController *)donateFoodController 
{
    if (donateFoodController == nil) 
	{
        donateFoodController = [[DonateFoodViewController alloc] initWithNibName:@"DonateFoodViewController" bundle:nil];
    }
	
    return donateFoodController;
}

- (DonateMoneyViewController *)donateMoneyController 
{
    if (donateMoneyController == nil) 
	{
        donateMoneyController = [[DonateMoneyViewController alloc] initWithNibName:@"DonateMoneyViewController" bundle:nil];
    }
	
    return donateMoneyController;
}


@end