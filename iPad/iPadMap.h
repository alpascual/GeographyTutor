//
//  iPadMap.h
//  Geography Tutor
//
//  Created by Al Pascual on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "MyAnnotation.h"
#import "StateList.h"
#import "MapUtils.h"
#import "SoundManager.h"
#import "ResultsManager.h"
#import "CongratulationsController.h"


@interface iPadMap : UIViewController <MKMapViewDelegate> {

	MKMapView *mapView;
	NSString *answerState;
	StateList *states;
	MapUtils *mapUtils;
	ResultsManager *resultManager;
	
	UILabel *questionLabel;
	UIToolbar *toolbar;
	SoundManager *sounds;
	NSNumber *iLevel;
	
	int triesAnswer;
	int winAnswers;
	CongratulationsController *congratulationController;
	UILabel *scoreLabel;
	Boolean bRestarting;
	
	UIAlertView *alertView;
	
	UIImageView *overlay;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) StateList *states;
@property (nonatomic, retain) MapUtils *mapUtils;
@property (nonatomic, retain) SoundManager *sounds;
@property (nonatomic, retain) NSNumber *iLevel;
@property (nonatomic, retain) ResultsManager *resultManager;
@property (nonatomic, retain) CongratulationsController *congratulationController;
@property (nonatomic, retain) NSString *answerState;
@property (nonatomic, retain) UIAlertView *alertView;

@property (nonatomic, retain) IBOutlet UILabel *questionLabel;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UIImageView *overlay;


@end
