//
//  DonateViewController.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import "DonateViewController.h"
#import "DonateWebViewController.h"

@implementation DonateViewController
@synthesize myTableView;
@synthesize listData;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	
	array = [[NSArray alloc]initWithObjects:@"Donate Time",@"Donate Money",@"Donate Food",nil];
    
    self.listData = array;
    [array release];

	
	
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
	
	//enlever la selection du Row	
	NSIndexPath *selectedIndexPath = [myTableView indexPathForSelectedRow];
	if (selectedIndexPath) 
		[myTableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
	
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark - #pragma mark Table View Data Source Methods
/*

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [array count];
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    switch (indexPath.section) 
    {
        case 0:
            [self.navigationController pushViewController:self.donateWebController animated:YES];
            break;
            
        case 1:
            [self.navigationController pushViewController:self.donateWebController animated:YES];
            break;
            
        case 2:
            [self.navigationController pushViewController:self.donateWebController animated:YES];
            break;
            
        default:
            break;
    }
}

*/

// The lazy-loading "getter" for donateWebController.
- (DonateWebViewController *)donateWebController {
    if (donateWebController == nil) {
        donateWebController = [[DonateWebViewController alloc] initWithNibName:@"DonateWebViewController" bundle:nil];
    }
	
    return donateWebController;
}



@end
