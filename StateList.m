//
//  StateList.m
//  Geography Tutor
//
//  Created by Al Pascual on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StateList.h"


@implementation StateList


- (NSString*) GetRandomState
{
	if ( listOfStates == nil)
		[self BuildStates];
	
	int ran = -1;
	do{
		ran = arc4random() % listOfStates.count;
	}while (_lastran == ran);
	
	return [listOfStates objectAtIndex:ran];
}

- (void) BuildStates
{
	// set all states
	if ( listOfStates == nil )
		listOfStates = [[NSMutableArray alloc] init];
	else {
		[listOfStates removeAllObjects];
	}
	
	[listOfStates addObject:@"Alabama"];
	[listOfStates addObject:@"Alaska"];	
	[listOfStates addObject:@"Arizona"];
	[listOfStates addObject:@"Arkansas"];
	[listOfStates addObject:@"California"];
	[listOfStates addObject:@"Colorado"];
	[listOfStates addObject:@"Connecticut"];
	[listOfStates addObject:@"Delaware"];
	//[listOfStates addObject:@"District of Columbia"];
	[listOfStates addObject:@"Florida"];
	[listOfStates addObject:@"Georgia"];
	//[listOfStates addObject:@"Guam"];
	[listOfStates addObject:@"Hawaii"];
	[listOfStates addObject:@"Idaho"];
	[listOfStates addObject:@"Illinois"];
	[listOfStates addObject:@"Indiana"];
	[listOfStates addObject:@"Iowa"];
	[listOfStates addObject:@"Kansas"];
	[listOfStates addObject:@"Kentucky"];
	[listOfStates addObject:@"Louisiana"];
	[listOfStates addObject:@"Maine"];
	[listOfStates addObject:@"Maryland"];
	[listOfStates addObject:@"Massachusetts"];
	[listOfStates addObject:@"Michigan"];
	[listOfStates addObject:@"Minnesota"];
	[listOfStates addObject:@"Mississippi"];
	[listOfStates addObject:@"Missouri"];
	[listOfStates addObject:@"Montana"];
	[listOfStates addObject:@"Nebraska"];
	[listOfStates addObject:@"Nevada"];
	[listOfStates addObject:@"New Hampshire"];
	[listOfStates addObject:@"New Jersey"];
	[listOfStates addObject:@"New Mexico"];
	[listOfStates addObject:@"New York"];
	[listOfStates addObject:@"North Carolina"];
	[listOfStates addObject:@"North Dakota"];
	[listOfStates addObject:@"Ohio"];
	[listOfStates addObject:@"Oklahoma"];
	[listOfStates addObject:@"Oregon"];
	[listOfStates addObject:@"Pennsylvania"];	
	//[listOfStates addObject:@"Puerto Rico"];
	[listOfStates addObject:@"Rhode Island"];
	[listOfStates addObject:@"South Carolina"];
	[listOfStates addObject:@"South Dakota"];
	[listOfStates addObject:@"Tennessee"];
	[listOfStates addObject:@"Texas"];
	[listOfStates addObject:@"Utah"];
	[listOfStates addObject:@"Vermont"];
	[listOfStates addObject:@"Virginia"];
	//[listOfStates addObject:@"Virgin Islands"];	
	//[listOfStates addObject:@"Washington"];
	[listOfStates addObject:@"West Virginia"];
	[listOfStates addObject:@"Wisconsin"];
	[listOfStates addObject:@"Wyoming"];
		
	[listOfStates retain];

}

- (void)dealloc {
    
	[listOfStates release];
	listOfStates = nil;
	
    [super dealloc];
}

@end
