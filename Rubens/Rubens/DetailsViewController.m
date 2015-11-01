//
//  DetailsViewController.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"


@implementation DetailsViewController
//@synthesize myTextView;
@synthesize selectedPOI, mapView;
@synthesize myTableView, listData,listData2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.navigationItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]] autorelease];
    }
    return self;
}

- (void)dealloc
{
	[mapView release];
	[selectedPOI release];
	[myTableView release];
	[listData release];
	[listData2 release];
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (IBAction)backButtonPressed
{
	//	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	//	self.myTextView.text = selectedPOI.title;
	
	
	
}

- (void)viewWillAppear:(BOOL)animated
{
	
	NSArray *tempArray = [[NSArray alloc]initWithObjects:@"Name",@"Address",@"City",@"Phone",@"Description",nil];
	NSArray *tempArray2 = [[NSArray alloc]initWithObjects:selectedPOI.title,selectedPOI.street,selectedPOI.city,@"052-4678141",selectedPOI.description, nil];
    self.listData = tempArray;
	self.listData2 = tempArray2;
	
    [tempArray release];
	[tempArray2 release];
	
	
	[myTableView reloadData];
	/*	//textView
	 NSString *text = [NSString stringWithFormat:@"%@\n\n%@\n%@\n\n%@\n\n%@",selectedPOI.title,selectedPOI.street,selectedPOI.city,@"052-4678141",selectedPOI.description];
	 
	 self.myTextView.text = text;
	 */
	//	NSLog(@"%@\n\n%@\n%@\n\nTelephone: %@\n\nMobile: %@\n\nServices: %@"
	//	,selectedPOI.title,selectedPOI.street,selectedPOI.city,selectedPOI.description);
	
	//	NSLog(@"%@\n\n%@\n%@\n\nTelephone: %@\n\nMobile: %@\n\nServices: %@",selectedPOI.name_org,selectedPOI.streetHouseRoom,selectedPOI.countryCity,selectedPOI.telephone,selectedPOI.mobile,[GlobalMethods textForServicesString:selectedPOI.services]);
	
}

#pragma mark - #pragma mark Table View Data Source Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [listData count];
        default:
            return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil && indexPath.section == 0) 
    { 
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
	else if (cell == nil)
	{
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier] autorelease];
	}
    NSUInteger row = [indexPath row];
	
	CGRect myImageRect = CGRectMake(0.0f, 0.0f, 25.0f, 25.0f);
	UIImageView *myImage = [[UIImageView alloc] initWithFrame:myImageRect];
	[myImage setImage:[UIImage imageNamed:@"btn_Maps.png"]];
	
	if(indexPath.section == 0)
	{
		cell.textLabel.text = [listData objectAtIndex:row];
		cell.detailTextLabel.text = [listData2 objectAtIndex:row];
	}
	else	
	{
		cell.textLabel.text = @"Show On Map";
		cell.textLabel.textAlignment = UITextAlignmentCenter;
		cell.textLabel.textColor = [UIColor blueColor];
		cell.accessoryView = myImage;

	}
	CGRect myImagePhoneRect = CGRectMake(0.0f, 0.0f, 25.0f, 25.0f);
	UIImageView *myImagePhone = [[UIImageView alloc] initWithFrame:myImagePhoneRect];
	[myImagePhone setImage:[UIImage imageNamed:@"btn_Phone.png"]];
	
	if (indexPath.section == 0)
	{
		switch (indexPath.row)
		{
			case 0:
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				cell.detailTextLabel.adjustsFontSizeToFitWidth =YES;
				break;
			case 1:
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				cell.detailTextLabel.adjustsFontSizeToFitWidth =YES;
				break;
			case 2:
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				cell.detailTextLabel.adjustsFontSizeToFitWidth =YES;
				break;
			case 3:
				cell.accessoryView = myImagePhone;
				cell.detailTextLabel.textColor = [UIColor blueColor];
				break;
			case 4:
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				cell.detailTextLabel.adjustsFontSizeToFitWidth =YES;
				break;
			default:
				break;
		}
		
	}
	tableView.backgroundColor = [UIColor clearColor];
	
	return cell;
	
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Determine if row is selectable based on the NSIndexPath.
	if(indexPath.section == 0)
	{
		if (indexPath.row == 3) 
		{
			return indexPath;
		}
		else 
		{
			return nil;
		}
		
	}
	else
		return indexPath;
	
	//	[myTableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section == 0)
	{
		if (indexPath.row == 3) 
		{
			NSURL *URL = [NSURL URLWithString:@"tel://0524678141"];
			[[UIApplication sharedApplication] openURL:URL];
		}
	}
	else
		[self navigateToOrganizationButtonPressed];
	
	[myTableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)navigateToOrganizationButtonPressed
{
	//	NSTimeInterval locationAge = -[mapView.userLocation.];
	if (mapView.userLocation.location != nil)
	{
		NSString *currentLocationStr = [[NSString stringWithFormat:@"%f,%f",mapView.userLocation.coordinate.latitude,mapView.userLocation.coordinate.longitude]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
		NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?daddr=%@&saddr=%@",
						 [selectedPOI.organizationsCoordinate stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],currentLocationStr];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	}
	else
	{
		NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%@",
						 [selectedPOI.organizationsCoordinate stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	}
	
	
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.listData = nil;
	self.listData2 = nil;
	self.myTableView = nil;
}

@end
