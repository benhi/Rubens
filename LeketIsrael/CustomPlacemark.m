//
//  Created by Björn Sållarp on 2010-03-13.
//  NO Copyright 2010 MightyLittle Industries. NO rights reserved.
// 
//  Use this code any way you like. If you do like it, please
//  link to my blog and/or write a friendly comment. Thank you!
//
//  Read my blog @ http://blog.sallarp.com
//

#import "CustomPlacemark.h"


@implementation CustomPlacemark
@synthesize address, message, coordinate, coordinateRegion;

-(id)initWithRegion:(MKCoordinateRegion) coordRegion {
	self = [super init];
	
	if (self != nil) {
		coordinate = coordRegion.center;
		coordinateRegion = coordRegion;
	}
	
	return self;
}

- (NSString*)title {
	return address;
}

- (NSString *)subtitle
{
    return message;
}

- (void)dealloc {
	if(address != nil){
		[address release];
	}
	if(message != nil){
		[message release];
	}
	
	
	[super dealloc];
}
@end
