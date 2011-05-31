//
//  MapUtils.m
//  Geography Tutor
//
//  Created by Albert Pascual on 12/21/10.
//  Copyright 2010 Al. All rights reserved.
//

#import "MapUtils.h"
#import "MyAnnotation.h"


@implementation MapUtils

@synthesize sounds;
@synthesize mapViewglobal;

/*-(id)init
{
	//self.sounds = [[SoundManager alloc] init];
	
	return self;
}*/

- (void)loadMap:(MKMapView*)mapView : (SoundManager *)soundsMan : (int)MyLevel
{
	if ( MyLevel < 3 )
		mapView.mapType = MKMapTypeStandard;
	else if (MyLevel == 3 )
		mapView.mapType = MKMapTypeHybrid;
	else
		mapView.mapType = MKMapTypeSatellite;
	
	self.sounds = soundsMan;
	
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
	
	region.center.latitude = 40.105085;
	region.center.longitude = -99.005237;
	region.span.latitudeDelta = 36;
	region.span.longitudeDelta = 36;	
	
	[mapView setRegion:region];
	
	self.mapViewglobal = mapView;
	
}

- (NSString*) StartQuestion:(int)numberOfStates : (MKMapView*)mapView : (StateList*)states : (UIImageView *) activity
{
	//mapView.zoomEnabled = FALSE;
	
	
	activity.hidden = NO;
	
	//[self presentModalViewController:activity animated:YES];
	// Remove all annotations	
	mapView.showsUserLocation = NO;
	NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:[mapView.annotations count]+1];
			
	for (id annotation in mapView.annotations)
	{
		//if (annotation != mapView.userLocation)
		//[toRemove addObject:annotation];
		
		/*@try[sounds release];
		{[sounds release];
			NSLog(@"Try to removeObserver %@", annotation);	
			[annotation removeObserver:mapView forKeyPath:@"selected"];
		}
		@catch(id theException) {
			NSLog(@"In Catch %@", theException);				
		} */
		
		[[mapView viewForAnnotation:annotation] setHidden:YES];
				
	}
	
	//[mapView removeAnnotations:toRemove];
	
	
	NSString *answerState = [states GetRandomState];	
	[self addStateToMap:answerState:mapView];
	
	for (int i=0; i<numberOfStates-1; i++) {
		[self addStateToMap:[states GetRandomState]:mapView];		
	}
	
	[self.sounds LoadSound:@"canyoufind" :@"wav"];
	[self.sounds LoadSound:answerState :@"wav"];
	
	return answerState;
}

- (void) addStateToMap:(NSString*)state : (MKMapView*)mapView
{	
	CLLocationCoordinate2D location = [self addressLocation:state];
	MyAnnotation *addAnnotation = [[MyAnnotation alloc] init];
	
	[addAnnotation setCoordinate:location];
	[addAnnotation setTitle:state];
	
	[mapView addAnnotation:addAnnotation];
	
	[addAnnotation release];
}

-(CLLocationCoordinate2D) addressLocation:(NSString*)addressField
{
	NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", 
						   [addressField stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString]];
	NSArray *listItems = [locationString componentsSeparatedByString:@","];
	
	double latitude = 0.0;
	double longitude = 0.0;
	
	if([listItems count] >= 4 && [[listItems objectAtIndex:0] isEqualToString:@"200"]) {
		latitude = [[listItems objectAtIndex:2] doubleValue];
		longitude = [[listItems objectAtIndex:3] doubleValue];
	}
	else {
		//Show error
	}
	CLLocationCoordinate2D location;
	location.latitude = latitude;
	location.longitude = longitude;
	
	return location;
}

- (void) dealloc
{
	[super dealloc];
	
	[self.sounds release];
}

@end
