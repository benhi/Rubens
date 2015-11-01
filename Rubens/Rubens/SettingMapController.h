//
//  SettingMapController.h
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/26/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@protocol SettingMapControllerDelegate <NSObject>
-(void)MapTypeChangedToIndex:(NSUInteger)index;
@end



@interface SettingMapController : UIViewController
{
    UISegmentedControl *mySegmentedControl;
	
}

@property (nonatomic, assign) id <SettingMapControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mySegmentedControl;
- (IBAction)mapTypeChanged;
@end

