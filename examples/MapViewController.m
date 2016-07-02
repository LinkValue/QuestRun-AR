//
//  MapViewController.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "MapViewController.h"
#import "NextStepViewController.h"
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

- (BOOL)prefersStatusBarHidden {
	return YES;
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
		} completion:^(BOOL finished) {
			if (beacons && [beacons.major integerValue] == 0 && beacons.proximity == CLProximityImmediate){
				[self performSelector:@selector(launchNextScreen) withObject:nil afterDelay:0.5];
			} else if (beacons && [beacons.major integerValue] == 1 && beacons.proximity == CLProximityImmediate ){
			[self performSelector:@selector(launchFlechesScreen) withObject:nil afterDelay:0.5];
			}
		}];
	});
}

-(void) launchNextScreen{
	[self performSegueWithIdentifier:@"NextStepSegue" sender:nil];
	self.heightProgressConstraint.constant = 30;
	[UIView animateWithDuration:0.5 animations:^{
		[self.view layoutIfNeeded];
		self.thermometerProgress.backgroundColor = UIColorFromRGB(0x406ab2);
	}];
}

-(void)launchFlechesScreen{
	
	self.heightProgressConstraint.constant = 30;
	[UIView animateWithDuration:0.5 animations:^{
		[self.view layoutIfNeeded];
		self.thermometerProgress.backgroundColor = UIColorFromRGB(0x406ab2);
	}];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
	//[_heightProgressConstraint release];
	//[super dealloc];
}
@end
