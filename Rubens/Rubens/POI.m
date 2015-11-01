//
//  POI.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "POI.h"


@implementation POI
@synthesize title, subtitle, coordinate,latitude, longitude, street, city, description,organizationsCoordinate;



-(CLLocationCoordinate2D)coordinate
{
	coordinate.latitude = [self.latitude doubleValue];
	coordinate.longitude = [self.longitude doubleValue];
	
	return coordinate;
}

- (NSString*)title
{
	return title;
}

- (NSString *)subtitle
{
    return subtitle;
}

- (void)dealloc 
{
	
	[title release];
	[subtitle release];
	[latitude release];
	[longitude release];
	[street release];
	[description release];
	[city release];
	[organizationsCoordinate release];
	
	[super dealloc];
}


@end
