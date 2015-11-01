//
//  DetailsViewController.h
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "POI.h"

@interface DetailsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *listData;
	NSArray *listData2;
	UITableView *myTableView;
//	IBOutlet UITextView *myTextView;
	POI *selectedPOI;
	MKMapView *mapView;
}

@property (nonatomic, retain) POI *selectedPOI;
//@property (nonatomic, retain) UITextView *myTextView;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) NSArray *listData;
@property (nonatomic, retain) NSArray *listData2;
-(IBAction)backButtonPressed;
-(void)navigateToOrganizationButtonPressed;
@end
