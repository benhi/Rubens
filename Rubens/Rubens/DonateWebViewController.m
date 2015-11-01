//
//  DonateWebViewController.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import "DonateWebViewController.h"
#import "RootViewController.h"

@implementation DonateWebViewController
@synthesize myWebView;

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
//	self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//	self.navigationController.navigationBar.hidden = NO;
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}


//action des boutons
-(void)valuePressed:(UISegmentedControl *)segmentedControl 
{
	switch (segmentedControl.selectedSegmentIndex) 
	{
		case 0:
			[myWebView goBack];
			break;
		case 1:
			[myWebView goForward];
			break;
		default:
			break;
	}
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
		self.navigationItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]] autorelease];
		
// instancier un SegmentedController

		UISegmentedControl *mySegmentedControl = [[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"◀",@"▶", nil]] autorelease];
		
		//designe des boutons
		mySegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
		// deselectionner les boutons du SegmentedController apres clique
		mySegmentedControl.momentary=YES;
		
		[mySegmentedControl addTarget:self action:@selector(valuePressed:) forControlEvents:UIControlEventValueChanged];
		
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:mySegmentedControl] autorelease];
    
//		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed)];
	}
    return self;
}

- (void)dealloc
{
	[myWebView release];

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
    [super viewDidLoad];
	self.navigationController.navigationBar.hidden = NO;
	// Créer une URL
	NSURL *urlAddress = [NSURL URLWithString: @"http://www.leket.org.il/english/text/304.aspx"];
	// Faire une requête sur cette URL
	NSURLRequest *requestObject = [NSURLRequest requestWithURL:urlAddress];
	// Charger la requête dans la UIWebView
	[myWebView loadRequest:requestObject];

    // Do any additional setup after loading the view from its nib.
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

-(void)webViewDidFinishLoad:(UIWebView *)webView {
	[activityIndicator stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[activityIndicator stopAnimating];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
	[activityIndicator startAnimating];
}
-(void)backPressed {
//	RootViewController *viewController = [[[RootViewController alloc] init] autorelease];
//	
//	UINavigationController *navCon = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
//	navCon.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//	
//	[self presentModalViewController:navCon animated:YES];
}

@end
