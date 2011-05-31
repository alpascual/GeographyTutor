//
//  ResultsManager.h
//  Geography Tutor
//
//  Created by Al Pascual on 12/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResultsManager : NSObject {

}

- (int) rightAnswer:(int)times:(NSString *)title;
- (int) wrongAnswer:(int)times:(NSString *)title;

@end
