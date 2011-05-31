//
//  ResultsManager.m
//  Geography Tutor
//
//  Created by Al Pascual on 12/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResultsManager.h"


@implementation ResultsManager


- (int) rightAnswer:(int)times:(NSString *)title
{
	/*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good Job"
													message:[NSString stringWithFormat:@"You found %@", title]
												   delegate:nil
										  cancelButtonTitle:@"OK"                                          
										  otherButtonTitles:nil];
	
	[alert show];
	[alert release];*/
	
	
	times = times + 1;
	
	return times;
}


- (int) wrongAnswer:(int)times:(NSString *)title
{
	
	/*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong"
													message:[NSString stringWithFormat:@"You didn't find %@", title]
												   delegate:nil
										  cancelButtonTitle:@"OK"                                          
										  otherButtonTitles:nil];
	
	[alert show];
	[alert release];*/
	
	
	
	times = times + 1;
	
	return times;
}

@end
