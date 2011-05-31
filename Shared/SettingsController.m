//
//  SettingsController.m
//  Geography Tutor
//
//  Created by Albert Pascual on 12/21/10.
//  Copyright 2010 Al. All rights reserved.
//

#import "SettingsController.h"


@implementation SettingsController

@synthesize levelControl, startButton, iPadmap, iPhonemap;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		// The device is an iPad running iPhone 3.2 or later.		
		self.iPadmap = [[iPadMap alloc] initWithNibName:@"iPadMap" bundle:nil];
		self.iPadmap.iLevel = [NSNumber numberWithUnsignedInteger:1];
		
	}
	else
	{
		self.iPhonemap = [[iPhoneMap alloc] initWithNibName:@"iPhoneMap" bundle:nil];
		self.iPhonemap.iLevel = [NSNumber numberWithUnsignedInteger:1];
	}	
	
	
    
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[self.iPadmap release];
	[self.iPhonemap release];
	
    [super dealloc];
}


- (IBAction) startButton:(id)sender
{
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		int iTemp = levelControl.selectedSegmentIndex;
		self.iPadmap.iLevel = [NSNumber numberWithInt:iTemp];		// The device is an iPad running iPhone 3.2 or later.
		[self presentModalViewController:self.iPadmap animated:YES];
		
	}
	else
	{
		int iTemp = levelControl.selectedSegmentIndex;
		self.iPhonemap.iLevel = [NSNumber numberWithInt:iTemp];
		//[self.navigationController pushViewController:self.iPhonemap animated:YES];	
		[self presentModalViewController:self.iPhonemap animated:YES];		
	}	
	
}

@end
