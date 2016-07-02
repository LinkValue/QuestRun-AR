//
//  ClubMedBeaconManager.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "ClubMedBeaconManager.h"
#import <CoreLocation/CoreLocation.h>

@interface ClubMedBeaconManager()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) id<ClubMebBeaconDelegate> delegate;



@end

@implementation ClubMedBeaconManager

+ (ClubMedBeaconManager*)sharedInstanceWithDelegate:(id<ClubMebBeaconDelegate>) delegate {
	static ClubMedBeaconManager *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[ClubMedBeaconManager alloc] initWithDelegate:delegate];
	});
	return sharedInstance;
}

-(instancetype) initWithDelegate:(id<ClubMebBeaconDelegate>) delegate{
	if (self = [super init]){
		self.delegate = delegate;
	}
	return self;
}

-(void) registerRegion{
	if (!self.locationManager){
		self.locationManager = [[CLLocationManager alloc] init];
	}
	[self.locationManager requestAlwaysAuthorization];
	self.locationManager.delegate = self;
	
	NSUUID *beaconUUID = [[NSUUID alloc] initWithUUIDString:
						  @"CB77A7EF-E3F6-4375-BAED-A107205DAE7F"];
	NSString *beaconIdentifier = @"ibeacon.clubmed";
	CLBeaconRegion *beaconRegion1 = [[CLBeaconRegion alloc] initWithProximityUUID:
									beaconUUID major:0 minor:0 identifier:beaconIdentifier];
	CLBeaconRegion *beaconRegion2 = [[CLBeaconRegion alloc] initWithProximityUUID:
									beaconUUID major:1 minor:1 identifier:beaconIdentifier];
	[self.locationManager startRangingBeaconsInRegion:beaconRegion1];
	[self.locationManager startRangingBeaconsInRegion:beaconRegion2];
	
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region{
	if ([beacons count]){
		[self.delegate didRangeBeacons:[beacons firstObject] inRegion:region];
	}
}

@end
