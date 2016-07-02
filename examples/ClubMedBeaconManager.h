//
//  ClubMedBeaconManager.h
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import <Foundation/Foundation.h>
@class CLBeacon;
@class CLBeaconRegion;

@protocol ClubMebBeaconDelegate
-(void) didRangeBeacons:(CLBeacon*)beacons inRegion:(CLBeaconRegion *)region;
@end

@interface ClubMedBeaconManager : NSObject

@end
