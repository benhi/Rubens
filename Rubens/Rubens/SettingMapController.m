//
//  SettingMapController.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import "SettingMapController.h"


@implementation SettingMapController

@synthesize mySegmentedControl;
@synthesize delegate;

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
    [mySegmentedControl release];
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
    // Do any additional setup after loading the view from its nib.
}




- (IBAction)mapTypeChanged
{
    
//    switch (mySegmentedControl.selectedSegmentIndex) {
//        case 0:
//            MKMapTypeStandard;
//            break;
//        case 1:
//            MKMapTypeSatellite;
//            break;
//        case 2:
//            MKMapTypeHybrid;
//            break;
//        default:
//            break;
//    }
	
	[self.delegate MapTypeChangedToIndex:mySegmentedControl.selectedSegmentIndex];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.mySegmentedControl = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
