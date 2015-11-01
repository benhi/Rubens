//
//  RootViewController.m
//

#import "RootViewController.h"
#import "MapViewController.h"
#import "AboutViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	self.title = @"Home";
}

-(void)aboutPressed {
	AboutViewController *viewController = [[[AboutViewController alloc] init] autorelease];
	
	UINavigationController *navCon = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
	navCon.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	navCon.navigationBar.tintColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
	
	[self presentViewController:navCon animated:YES completion:nil];
}

-(void)mapPressed {
	MapViewController *viewController = [[[MapViewController alloc] init] autorelease];
	
	UINavigationController *navCon = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
	navCon.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	navCon.navigationBar.tintColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
	[self presentViewController:navCon animated:YES completion:nil];
}

@end