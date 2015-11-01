//
//  AboutViewController.m
//  LeketIsrael
//
//  Created by Yoni & Hagit Colb on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"

#define Offset 2.0

@implementation AboutViewController
@synthesize scrollView;

const CGFloat kScrollObjHeight	= 103;
const CGFloat kScrollObjWidth	= 134.40244018;
const NSUInteger kNumImages		= 6;

- (id)init {
    self = [super init];
    if (self) {
		self.navigationItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]] autorelease];

		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(donePressed)];
    }
    return self;
}

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView subviews];
	
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
		//	CGFloat kScrollObjWidthTemp = kScrollObjWidth + Offset;
			curXLoc += (kScrollObjWidth + Offset);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), [scrollView bounds].size.height)];
}

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor clearColor];
	
	// 1. setup the scrollview for multiple images and add it to the view controller
	//
	// note: the following can be done in Interface Builder, but we show this in code for clarity
	[scrollView setBackgroundColor:[UIColor clearColor]];
	[scrollView setCanCancelContentTouches:NO];
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView.scrollEnabled = YES;
	
	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
	// if you want free-flowing scroll, don't set this property.
	scrollView.pagingEnabled = NO;
	
	// load all the images from our bundle and add them to the scroll view
	NSUInteger i;
	for (i = 1; i <= kNumImages; i++)
	{
		NSString *imageName = [NSString stringWithFormat:@"image%d.png", i];
		UIImage *image = [UIImage imageNamed:imageName];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		
		
		// setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
		CGRect rect = imageView.frame;
		rect.size.height = kScrollObjHeight;
		rect.size.width = kScrollObjWidth;
		imageView.frame = rect;
		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
		[scrollView addSubview:imageView];
		[imageView release];
	}
	[self layoutScrollImages];	// now place the photos in serial layout within the scrollview
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Public API

-(IBAction)contactPressed {
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *viewController = [[MFMailComposeViewController alloc] init];
		viewController.mailComposeDelegate = self;
		[viewController setToRecipients:[NSArray arrayWithObject:@"info@leket.org"]];
		[viewController setSubject:@"Leket Israel on iPhone"];
		[self presentModalViewController:viewController animated:YES];
		[viewController release];
	} else {
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You can't send e-mail from this device. Check your mail accout settings." delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
	
	
}

- (void)dealloc
{	
	[scrollView release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
	// invoke super's implementation to do the Right Thing, but also release the input controller since we can do that	
	// In practice this is unlikely to be used in this application, and it would be of little benefit,
	// but the principle is the important thing.
	//
	[super didReceiveMemoryWarning];
}

-(void)donePressed {
	[self dismissModalViewControllerAnimated:YES];
}


@end
