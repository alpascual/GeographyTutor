//
//  AppDelegate_iPhone.h
//  Geography Tutor
//
//  Created by Al Pascual on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsController.h"

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	//iPadMap *iPadMapController;
	SettingsController *settingsController;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet iPadMap *iPadMapController;
@property (nonatomic, retain) IBOutlet SettingsController *settingsController;

@end

