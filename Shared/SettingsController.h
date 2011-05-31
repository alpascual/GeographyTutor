//
//  SettingsController.h
//  Geography Tutor
//
//  Created by Albert Pascual on 12/21/10.
//  Copyright 2010 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPadMap.h"
#import "iPhoneMap.h"


@interface SettingsController : UIViewController {

	UISegmentedControl *levelControl;
	UIButton *startButton;
	
	iPadMap *iPadmap;
	iPhoneMap *iPhonemap;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *levelControl;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) iPadMap *iPadmap;
@property (nonatomic, retain) iPhoneMap *iPhonemap;

- (IBAction) startButton:(id)sender;

@end
 