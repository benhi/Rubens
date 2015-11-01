//
//  SettingMapController.h
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@protocol SettingMapControllerDelegate <NSObject>
-(void)MapTypeChangedToIndex:(NSUInteger)index;
@end



@interface SettingMapController : UIViewController {
    UISegmentedControl *mySegmentedControl;
}

@property (nonatomic, assign) id <SettingMapControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mySegmentedControl;
- (IBAction)mapTypeChanged;
@end

