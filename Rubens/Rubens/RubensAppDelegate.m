//
//  LeketIsraelAppDelegate.m
//  LeketIsrael
//
//  Created by Yoni & Haguit Colb on 9/28/71.
//  Copyright 5771 __MyCompanyName__. All rights reserved.
//

#import "RubensAppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@implementation RubensAppDelegate


@synthesize window;

@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
	// Create a location manager instance to determine if location services are enabled. This manager instance will be
    // immediately released afterwards.
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
	
	if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0 && [CLLocationManager locationServicesEnabled] == NO) 
		|| ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0 && locationManager.locationServicesEnabled == NO) ) 
	{
		UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled" message:@"To re-enable, please go to Settings and turn on Location Service for this app." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
        [servicesDisabledAlert release];
//		return ;
    }
    [locationManager release];
	
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [window release];
    [navigationController release];
    [super dealloc];
}

@end
