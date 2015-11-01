//
//  MapViewController.m
//

#import "MapViewController.h"
#import "SettingMapController.h"

@implementation MapViewController

@synthesize myMapView;
@synthesize settingController;
@synthesize mySearchBar;
@synthesize searchAnnotations;
@synthesize forwardGeocoder;
@synthesize coordinate;
@synthesize arrayOfAnnotations;
@synthesize selectedPOI;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { 
        // Custom initialization
		
		//bouton recherche: searchItem
		UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBarItemPressed)];
		self.navigationItem.rightBarButtonItem = searchItem;
		[searchItem release];
		
		self.navigationItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]] autorelease];
		
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed)];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	mySearchBar.frame=CGRectMake(0,-mySearchBar.bounds.size.height,mySearchBar.frame.size.width,mySearchBar.frame.size.height);
	
	myMapView.mapType = MKMapTypeHybrid;
	CLLocationCoordinate2D coord;
//	coord.latitude = 31.404918;
//	coord.latitude = 45.0;
	coord.longitude = 34.859737;
	coord.latitude = 32.0;
	MKCoordinateRegion region;
	region.center = coord;
	region.span = MKCoordinateSpanMake(2.0,1.0);
	[myMapView setRegion:region];
	
	
	//		// initialiser le zoom
	//		MKCoordinateSpan span;
	//		span.latitudeDelta = 1.0;
	//		span.longitudeDelta = 0.5;
	//		MKCoordinateRegion region = myMapView.region;
	//		region.span = span;
	//		[myMapView setRegion:region animated:YES];
	
	
	
	self.arrayOfAnnotations = [NSMutableArray array];
	self.searchAnnotations = [NSMutableArray array];
	
	[myMapView addAnnotations: arrayOfAnnotations];
	[self downloadPlistData];
	//pointer pour detailsviewcontroller
	self.detailsController.mapView = self.myMapView;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	// Define region that contains Israel
	CLLocationCoordinate2D coord;
	coord.latitude = 31.404918;
//	coord.latitude = 32.0;
	coord.longitude = 34.859737;
	MKCoordinateRegion region;
	region.center = coord;
	region.span = MKCoordinateSpanMake(4,1.5);
	
	// Convert Region to Rect in mapView frame of reference
	CGRect regionRect = [mapView convertRegion:region toRectToView:mapView];

	CGPoint centerPoint = mapView.center;
	
	// Check if map center point is withing region rect, if not, recenter map.
	if(!CGRectContainsPoint(regionRect, centerPoint)) {
		mapView.centerCoordinate = coord;
	}
}

-(void)downloadPlistData
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"organizations" ofType:@"plist"];
	//	[NSDictionary dictionaryWithContentsOfFile:filePath];
	NSDictionary *root=[NSDictionary dictionaryWithContentsOfFile:filePath];
	
	
	for(NSString *myKey in root)
	{
		NSDictionary *dict = [root objectForKey:myKey];
		
		
		NSString *coordsString = [dict objectForKey:@"Coordonates"];
		
		if ([coordsString isEqualToString:@""])
		{
			continue;
		}			
		
		POI *poi = [[POI alloc] init];
		
		NSArray *coords = [coordsString componentsSeparatedByString:@","];
		poi.latitude = [NSNumber numberWithDouble:[[coords objectAtIndex:0] doubleValue]];
		poi.longitude = [NSNumber numberWithDouble:[[coords objectAtIndex:1] doubleValue]];
		
		
		poi.title = (NSString*)[dict objectForKey:@"Name"];
		poi.subtitle = (NSString*)[dict objectForKey:@"Description"];
		poi.street = (NSString*)[dict objectForKey:@"Address"];
		poi.description = (NSString*)[dict objectForKey:@"Description"];
		poi.city = (NSString*)[dict objectForKey:@"City"];
		poi.organizationsCoordinate = (NSString*)[dict objectForKey:@"Coordonates"];

		[arrayOfAnnotations addObject:poi];
		[poi release];
		[myMapView addAnnotations:arrayOfAnnotations];
	}
//	NSLog(@"array of annotations = %@", arrayOfAnnotations);
}

- (IBAction)showCurl 
{
	
	//  SettingMapController *settingController = [[[SettingMapController alloc] init] autorelease];
	[self.settingController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:settingController animated:YES completion:nil];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"Searching for: %@", mySearchBar.text);
	if(forwardGeocoder == nil)
	{
		forwardGeocoder = [[BSForwardGeocoder alloc] initWithDelegate:self];
	}
	
	// Forward geocode!
	[forwardGeocoder findLocation:mySearchBar.text];
}

- (IBAction)searchBarItemPressed
{
	
	//	if (mySearchBar.hidden==NO)
	//		mySearchBar.hidden=YES;
	//	else
	//		mySearchBar.hidden=NO;
	
	
	//	mySearchBar.hidden = !mySearchBar.hidden;
	
	if (mySearchBar.frame.origin.y >= 0) 
	{
		//bouton recherche: searchItem
		UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBarItemPressed)];
		self.navigationItem.rightBarButtonItem = searchItem;
		[searchItem release];

	}
	else
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(searchBarItemPressed)];

		
	
	[UIView beginAnimations:@"searchBarItemPressed" context:nil];
	[UIView setAnimationDuration:0.5];
	
	if (mySearchBar.frame.origin.y >= 0)
	{
		mySearchBar.frame=CGRectMake(0,-mySearchBar.bounds.size.height,mySearchBar.frame.size.width,mySearchBar.frame.size.height);
		
	}
	else{
		mySearchBar.frame=CGRectMake(0,0,mySearchBar.frame.size.width,mySearchBar.frame.size.height);

	}
	
	[UIView commitAnimations];
	
	//cacher le clavier
	if(mySearchBar.frame.origin.y <0)
	{
		[mySearchBar resignFirstResponder];
		
	}
	else {
		[mySearchBar becomeFirstResponder];
	}
	/*	
	 // flipping animation
	 [UIView beginAnimations:@"flipping" context:nil];
	 [UIView setAnimationDuration:0.75];
	 [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:NO];
	 mySearchBar.hidden = !mySearchBar.hidden;
	 [UIView commitAnimations];
	 */	
}

-(MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	
	
	if ([annotation isKindOfClass:[MKUserLocation class]])
		return nil;
	
	
	if ([annotation isKindOfClass:[POI class]]) 
	{
		static NSString* POIAnnotationIdentifier = @"POIAnnotationIdentifier";
		MKPinAnnotationView* pinView = (MKPinAnnotationView *)[myMapView dequeueReusableAnnotationViewWithIdentifier:POIAnnotationIdentifier];
		if (!pinView)
		{
			MKPinAnnotationView* customPinView =[[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:POIAnnotationIdentifier] autorelease];
			
			customPinView.centerOffset = CGPointMake(0.0,-18.0);
			customPinView.animatesDrop = NO;
			
			customPinView.image = [UIImage imageNamed:@"house.png"];
			customPinView.canShowCallout = YES;
			
			//ptte fleche sur le cote pr afficher plus d'info
			UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//			[rightButton addTarget:self action:@selector(showDetails) forControlEvents:UIControlEventTouchUpInside];
			customPinView.rightCalloutAccessoryView = rightButton;
			
			return customPinView;
		}
		else
			pinView.annotation = annotation;
		
		return pinView;
	}
	return nil;
	
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	self.selectedPOI = (POI*)view.annotation;
	
	self.detailsController.selectedPOI = self.selectedPOI;
	
//	[self presentModalViewController:detailsController animated:YES];

	[self.navigationController pushViewController:self.detailsController animated:YES];
}

- (void)showDetails
{
//	//	[self.navigationController setToolbarHidden:YES animated:NO];

//	self.detailsController.selectedPOI = ;
	
    [self.navigationController pushViewController:self.detailsController animated:YES];
}

- (IBAction) goButtonPressed
{
	// Create a location manager instance to determine if location services are enabled. This manager instance will be
    // immediately released afterwards.
    CLLocationManager *manager = [[CLLocationManager alloc] init];
	
	float f1 = [[[UIDevice currentDevice] systemVersion] floatValue];
	NSLog(@"%f",f1);
	
	BOOL loc = [CLLocationManager locationServicesEnabled];
	if (loc)
		NSLog(@"ON");
	else
		NSLog(@"OFF");
	
	
	if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0 && [CLLocationManager locationServicesEnabled] == NO) 
		|| ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0 && manager.locationServicesEnabled == NO) ) 
	{
		UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled" message:@"To re-enable, please go to Settings and turn on Location Service for this app." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
        [servicesDisabledAlert release];
//		return;
    } else {
		if (myMapView.userLocation.coordinate.latitude >= -90.0 && myMapView.userLocation.coordinate.latitude <= 90.0
			&& myMapView.userLocation.coordinate.longitude >= -180.0 && myMapView.userLocation.coordinate.longitude <= 180.0) 
		{
			[myMapView setCenterCoordinate:myMapView.userLocation.coordinate animated:YES];
			
			// initialiser le zoom
			MKCoordinateSpan span;
			span.latitudeDelta = 0.1;
			span.longitudeDelta = 0.1;
			MKCoordinateRegion region = myMapView.region;
			region.span = span;
			[myMapView setRegion:region animated:YES];
		}
	}

	[manager release];
}

- (void)forwardGeocoderError:(NSString *)errorMessage
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
													message:@"The SEARCH function requires an active internet connection"
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
	
}

-(void)forwardGeocoderFoundLocation
{
	if(forwardGeocoder.status == G_GEO_SUCCESS)
	{
		
		// Remove previous search result annotations
		[myMapView removeAnnotations:self.searchAnnotations];
		[searchAnnotations removeAllObjects];
		
		BSKmlResult *place = [forwardGeocoder.results objectAtIndex:0];
		
		// Add a placemark on the map
		CustomPlacemark *placemark = [[CustomPlacemark alloc] initWithRegion:place.coordinateRegion];
		
		placemark.address = @" ";
		
		
		NSMutableString *address = [NSMutableString stringWithCapacity:1];
		for (BSAddressComponent *comp in place.addressComponents) {
			[address appendString:comp.longName];
			[address appendString:@" "];
			
		}
		
		placemark.message = address; 
		[myMapView addAnnotation:placemark];	
		[searchAnnotations addObject:placemark];
		[placemark release];
		
		// Zoom into the location		
		[myMapView setRegion:place.coordinateRegion animated:TRUE];
		
		
		// Dismiss the keyboard
		[mySearchBar resignFirstResponder];
	}
	else {
		NSString *message = @"";
		
		switch (forwardGeocoder.status) {
			case G_GEO_BAD_KEY:
				message = @"The API key is invalid.";
				break;
				
			case G_GEO_UNKNOWN_ADDRESS:
				message = [NSString stringWithFormat:@"Could not find %@", forwardGeocoder.searchQuery];
				break;
				
			case G_GEO_TOO_MANY_QUERIES:
				message = @"Too many queries has been made for this API key.";
				break;
				
			case G_GEO_SERVER_ERROR:
				message = @"Server error, please try again.";
				break;
				
				
			default:
				break;
		}
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" 
														message:message
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)MapTypeChangedToIndex:(NSUInteger)index 
{
	switch (index) {
        case 0:
            myMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            myMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            myMapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
	[self dismissModalViewControllerAnimated:YES];
}

// The lazy-loading "getter" for SettingMapController.
- (SettingMapController *)settingController 
{
    if (settingController == nil) 
	{
        settingController = [[SettingMapController alloc] initWithNibName:@"SettingMapController" bundle:nil];
		settingController.delegate = self;
    }
	
    return settingController;
	
}

- (void)viewDidUnload
{
    
	[super viewDidUnload];
    self.mySearchBar = nil;
	detailsController = nil;
}

- (void)dealloc
{
	[detailsController release];
	[settingController release];
	[selectedPOI release];
    [myMapView release];
	//	[showCurlButton release];
	[mySearchBar release];
	[searchAnnotations release];
	[arrayOfAnnotations release];
	if(forwardGeocoder != nil)
	{
		[forwardGeocoder release];
	}
	

	[super dealloc];

    
}

// The lazy-loading "getter" for detailsController.
- (DetailsViewController *)detailsController
{
    if (detailsController == nil) {
        detailsController = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
    }
	
    return detailsController;
}

-(void)backPressed {
	[self dismissModalViewControllerAnimated:YES];
}


@end
