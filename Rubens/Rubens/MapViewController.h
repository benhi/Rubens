//
//  MapViewController.h
//  LeketIsrael
//
//  Created by Yoni & Hagit Colb on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SettingMapController.h"

#import "BSForwardGeocoder.h"
#import "BSKmlResult.h"
#import "CustomPlacemark.h"

#import "POI.h"
#import "DetailsViewController.h"


@interface MapViewController : UIViewController <UISearchBarDelegate,SettingMapControllerDelegate, BSForwardGeocoderDelegate, MKAnnotation> 
{
    MKMapView *myMapView;
    SettingMapController *settingController;
	IBOutlet UISearchBar *mySearchBar;
	BSForwardGeocoder *forwardGeocoder;
	NSMutableArray *searchAnnotations;
	
	CLLocationCoordinate2D coordinate;
	//    NSString *Title;
	//    NSString *Subtitle;
	NSMutableArray *arrayOfAnnotations;
	
	DetailsViewController *detailsController;
	POI *selectedPOI;


}


@property (nonatomic, retain) POI *selectedPOI;

@property (nonatomic, retain) IBOutlet MKMapView *myMapView;


@property (nonatomic, retain, readonly) SettingMapController *settingController;
- (IBAction)showCurl;
- (IBAction) goButtonPressed;


@property(nonatomic, retain) UISearchBar *mySearchBar;
-(IBAction)searchBarItemPressed;

@property (nonatomic, retain) BSForwardGeocoder *forwardGeocoder;
@property (nonatomic, retain) NSMutableArray *searchAnnotations;
@property (nonatomic, retain) NSMutableArray *arrayOfAnnotations;

@property (nonatomic) CLLocationCoordinate2D coordinate;
//@property (nonatomic,retain) NSString * myTitle;
//@property (nonatomic,retain) NSString * mySubtitle;
//+ (id) annotationWithCoordinate:(CLLocationCoordinate2D ) newCoordinate;

//-(id) initWithCoordinate:(CLLocationCoordinate2D ) newCoordinate;

@property (nonatomic, retain, readonly) DetailsViewController *detailsController;
-(void)downloadPlistData;

@end
