//
//  StateList.h
//  Geography Tutor
//
//  Created by Al Pascual on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StateList : NSObject {

	NSMutableArray *listOfStates;
	int _lastran;
	
}

- (void) BuildStates;
- (NSString*) GetRandomState;

@end
