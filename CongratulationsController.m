//
//  CongratulationsController.m
//  Geography Tutor
//
//  Created by Al Pascual on 12/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CongratulationsController.h"


@implementation CongratulationsController

@synthesize myScore;
@synthesize sounds;


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
	
	// How many wins
	//myScore.text = [[NSString alloc] initWithFormat:@"%d", winAnswers ];
	
	if ( winAnswers == 10 )		
		myScore.text = @"A+";
	else if ( winAnswers >= 8 )
		myScore.text = @"A";
	else if ( winAnswers >= 6 )
		myScore.text = @"B";
	else if ( winAnswers >= 4 )
		myScore.text = @"C";
	else if ( winAnswers >= 2 )
		myScore.text = @"D";
	else {
		myScore.text = @"F";
	}
	
	if ( self.sounds != nil)
		
		[self.sounds LoadSound:@"congratulations" :@"wav"];
}

-(void) PlayIt:(SoundManager *) snd
{
	[snd LoadSound:@"congratulations" :@"wav"];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}

- (IBAction) playAgain:(id)sender
{
    [super dismissModalViewControllerAnimated:YES];
}


- (void) setWin:(int)myWin
{
	winAnswers = myWin;
	/*if ( winAnswers == 10 )		
		myScore.text = @"A+";
	else if ( winAnswers >= 8 )
		myScore.text = @"A";
	else if ( winAnswers >= 6 )
		myScore.text = @"B";
	else if ( winAnswers >= 4 )
		myScore.text = @"C";
	else if ( winAnswers >= 2 )
		myScore.text = @"D";
	else {
		myScore.text = @"F";
	}*/

		
}

- (void) setSound:(SoundManager *) soundMan
{
	self.sounds = soundMan;
}

@end
