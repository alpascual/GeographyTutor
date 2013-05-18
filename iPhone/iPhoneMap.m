//
//  iPhoneMap.m
//  Geography Tutor
//
//  Created by Al Pascual on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "iPhoneMap.h"


@implementation iPhoneMap

@synthesize mapView, states, mapUtils, questionLabel, sounds, iLevel, resultManager, congratulationController;
@synthesize answerState;
@synthesize scoreLabel;
@synthesize alertView;
@synthesize overlay;

static NSString* const ANNOTATION_SELECTED_DESELECTED = @"mapAnnotationSelectedOrDeselected";


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
	
	bDeleting = NO;
	bRestarting = NO;
	
	self.mapView.delegate = self;

	self.mapUtils = [[MapUtils alloc] init];	
	self.sounds = [[SoundManager alloc] init]; 
	self.sounds.overlay = self.overlay;
	
	int myLevel = [self.iLevel intValue];
	myLevel = myLevel + 2;
	
	[self.mapUtils loadMap:self.mapView:self.sounds:myLevel];
	
	self.states = [[StateList alloc] init];	
	self.resultManager = [[ResultsManager alloc] init];
	triesAnswer = 0;
	winAnswers = 0;
	
	
	// Needs to be move somewhere else when the press the button maybe
	self.answerState = [self.mapUtils StartQuestion:myLevel:self.mapView:self.states:self.overlay];
	
	questionLabel.text = [[NSString alloc]initWithFormat:@"Can you find the state of %@?", self.answerState];
	
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void) viewWillAppear:(BOOL)animated
{
	if ( bRestarting == YES )
	{
		bRestarting = NO;
		// Needs to be move somewhere else when the press the button maybe
		int myLevel = [self.iLevel intValue];
		myLevel = myLevel + 2;
				
		// Needs to be move somewhere else when the press the button maybe
		self.answerState = [self.mapUtils StartQuestion:myLevel:self.mapView:self.states:self.overlay];
		[questionLabel.text release];
		questionLabel.text = nil;
		
		questionLabel.text = [[NSString alloc]initWithFormat:@"Can you find the state of %@?", self.answerState];
		
		self.mapView.delegate = self;
		
		if (self.resultManager != nil){
			[self.resultManager release];
			self.resultManager = [[ResultsManager alloc] init];
		}
	}
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
    [super dealloc];
		
	[self removeObserver:self forKeyPath:@"selected"];
	[self.states release];
	[self.mapUtils release];
	[self.sounds release];
	[self.resultManager release];
	[self.alertView release];
	[self.overlay release];
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(MyAnnotation *)views {
	
	for (MyAnnotation *anAnnotationView in views) {
		//[anAnnotationView setCanShowCallout:YES];
		[anAnnotationView addObserver:self
						   forKeyPath:@"selected"
							  options:NSKeyValueObservingOptionNew
						      context:(__bridge void *)(ANNOTATION_SELECTED_DESELECTED)];
	}
}



- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
	
	if ( bDeleting == YES)
		return;
	
    NSString *action = (__bridge NSString *)context;
	if ([action isEqualToString:ANNOTATION_SELECTED_DESELECTED]) {
		BOOL annotationSelected = [[change valueForKey:@"new"] boolValue];
		if (annotationSelected) {
			NSLog(@"Annotation was selected, do whatever required");
			// Accions when annotation selected
			
			MKPinAnnotationView *tempAnnotation = ((MKPinAnnotationView*) object);			
						
			MyAnnotation *annot = tempAnnotation.annotation;
			
			if ( [annot title] == answerState)
			{
				bDeleting = YES;
				NSLog(@"YES %@", [annot title]);
				
				winAnswers = winAnswers + 1;
				self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%d", winAnswers];
				
				// Collects the answer
				triesAnswer = [self.resultManager rightAnswer:triesAnswer:[annot title]];
				
				NSLog(@"Tries %d", triesAnswer);
				if ( triesAnswer < 10 )
				{ 						
					// Starts questions again
					int myLevel = [self.iLevel intValue];
					myLevel = myLevel + 2;
					[self.sounds LoadRandomSound:@"yes":@"wav"];
					
					[self.answerState release];
					self.answerState = nil;
					
					[[NSNotificationCenter defaultCenter] removeObserver:self];
					//[mapView.annotations removeObserver:self forKeyPath:@"selected"];
					
					// Removing Observations
					/*for (id annotation in mapView.annotations)
					{
						@try
						{
							NSLog(@"Try to removeObserver %@", annotation);	
							[annotation removeObserver:nil forKeyPath:@"selected"];
						}
						@catch(id theException) {
							NSLog(@"In Catch %@", theException);				
						} 						
					}*/
					
					//Create UIAlertView alert
					/*if ( self.alertView != nil)
					{
						[self.alertView dismissWithClickedButtonIndex:0 animated:TRUE];
						[self.alertView release];
						self.alertView = nil;
					}
					
					self.alertView = [[UIAlertView alloc] initWithTitle:@"Correct" 
																message:nil 
															   delegate:self 
													  cancelButtonTitle:@"Cancel" 
													  otherButtonTitles:nil];
					
					[self.alertView addButtonWithTitle:@"OK"];
					[self.alertView show];
					 */
					
										
					// Needs to be move somewhere else when the press the button maybe
					self.answerState = [self.mapUtils StartQuestion:myLevel:self.mapView:self.states:self.overlay];
					[questionLabel.text release];
					questionLabel.text = nil;
					
					questionLabel.text = [[NSString alloc]initWithFormat:@"Can you find the state of %@?", self.answerState];	
					bDeleting = NO;
				}
				else {
					// Go to a congratulations page and let them play again
					if ( self.congratulationController == nil )
						self.congratulationController = [[CongratulationsController alloc] initWithNibName:@"CongratulationsController" bundle:nil];
					
					[self.congratulationController setWin:winAnswers];
					[self.congratulationController setSound:self.sounds];
					
					[self presentModalViewController:self.congratulationController animated:YES];
					
					winAnswers = 0;
					triesAnswer = 0;
					
					[self.answerState release];
					self.answerState = nil;
					
					// Signal new Starts
					bRestarting = YES;
				}
			}
			else
			{
				triesAnswer = [self.resultManager wrongAnswer:triesAnswer:[annot title]];
				
				if ( winAnswers != 0)
					winAnswers = winAnswers -1;
				
				self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%d", winAnswers];
				
				[self.sounds LoadRandomSound:@"no":@"wav"];
			}
			
		}else {
			NSLog(@"Annotation was deselected, do what you must");
			// Accions when annotation deselected
			
			//MKPinAnnotationView *tempAnnotation = ((MKPinAnnotationView*) object);
			//[tempAnnotation removeObserver:self forKeyPath:@"selected"];
		}
	}
}


@end
