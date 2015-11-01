//
//  POI.h
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface POI : NSObject <MKAnnotation>
{
	NSString *title;
	NSString *subtitle;
	NSString *street;
	NSString *city;
	NSString *description;
	CLLocationCoordinate2D coordinate;
	NSNumber *latitude;
	NSNumber *longitude;
	
	NSString *organizationsCoordinate;

}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSString *street;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *organizationsCoordinate;

@end
