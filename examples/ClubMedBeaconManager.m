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
@property (nonatomic, assign) BOOL hasVisited;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion1;

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
	self.beaconRegion1 = [[CLBeaconRegion alloc] initWithProximityUUID:
									beaconUUID identifier:beaconIdentifier];

	[self.locationManager startRangingBeaconsInRegion:self.beaconRegion1];
	
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region{
		CLBeacon *nearBeacon = [beacons firstObject];
	if (nearBeacon){
		if ([nearBeacon.major integerValue] == 1 || !self.hasVisited){
			if ([nearBeacon.major integerValue] == 0 && nearBeacon.proximity == CLProximityImmediate){
				self.hasVisited = YES;
			}
			[self.delegate didRangeBeacons:nearBeacon inRegion:region];
			if ([nearBeacon.major integerValue] == 1 && nearBeacon.proximity == CLProximityImmediate){
				[manager stopRangingBeaconsInRegion:self.beaconRegion1];
			}
		}
	}
	
}

@end
