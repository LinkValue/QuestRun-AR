//
//  MapViewController.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "MapViewController.h"
#import "ClubMedBeaconManager.h"

@interface MapViewController ()<ClubMebBeaconDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTucheMarker;
@property (weak, nonatomic) IBOutlet UIView *thermometerProgress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightProgressConstraint;

@end

@implementation MapViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	ClubMedBeaconManager *beaconManager = [ClubMedBeaconManager sharedInstanceWithDelegate:self];
	[beaconManager registerRegion];
	self.thermometerProgress.backgroundColor = UIColorFromRGB(0x406ab2);
	self.heightProgressConstraint.constant = 30;
}


-(void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.bottomSpaceTucheMarker.constant = 170;
	
	[UIView animateWithDuration:1 animations:^{
		[self.view layoutIfNeeded];
	}];
}



-(void)didRangeBeacons:(CLBeacon *)beacons inRegion:(CLBeaconRegion *)region{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIColor *color;
		// Your code to run on the main queue/thread
		if (beacons.proximity == CLProximityImmediate){
			self.heightProgressConstraint.constant = 340;
			color = UIColorFromRGB(0xda212e);
		} else if (beacons.proximity == CLProximityNear) {
			self.heightProgressConstraint.constant = 170;
			color =  UIColorFromRGB(0xcc6633);
		} else if (beacons.proximity == CLProximityFar) {
			self.heightProgressConstraint.constant = 100;
			color =  UIColorFromRGB(0x406ab2);
		} else {
			self.heightProgressConstraint.constant = 30;
			color = UIColorFromRGB(0x406ab2);
		}
		[UIView animateWithDuration:1 animations:^{
			self.thermometerProgress.backgroundColor = color;
			[self.view layoutIfNeeded];
		}];
	});
}

- (void)dealloc {
	//[_heightProgressConstraint release];
	//[super dealloc];
}
@end
