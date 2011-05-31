//
//  MapUtils.h
//  Geography Tutor
//
//  Created by Albert Pascual on 12/21/10.
//  Copyright 2010 Al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "StateList.h"
#import "SoundManager.h"

@interface MapUtils : NSObject {

	SoundManager *sounds;
	MKMapView* mapViewglobal;
}

@property (nonatomic,retain) SoundManager *sounds;
@property (nonatomic, retain) MKMapView* mapViewglobal;

//-(id)init;
- (NSString*) StartQuestion:(int)numberOfStates : (MKMapView*)mapView : (StateList*)states : (UIImageView *) activity;
- (void)loadMap:(MKMapView*)mapView : (SoundManager *)soundsMan : (int)MyLevel;
-(CLLocationCoordinate2D) addressLocation:(NSString*)addressField;
- (void) addStateToMap:(NSString*)state : (MKMapView*)mapView;

@end
