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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpaceTucheMarker;
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
	
	self.bottomSpaceTucheMarker.constant = 150;
	
	[UIView animateWithDuration:1 animations:^{
		[self.view layoutIfNeeded];
	}];
	
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

-(void)didRangeBeacons:(CLBeacon *)beacons inRegion:(CLBeaconRegion *)region{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIColor *color;
		NSInteger leftValue;
		NSInteger bottomValue;
		// Your code to run on the main queue/thread
		if (beacons.proximity == CLProximityImmediate){
			self.heightProgressConstraint.constant = 340;
			color = UIColorFromRGB(0xda212e);
			if ([beacons.major integerValue] == 1){
				self.bottomSpaceTucheMarker.constant = 440;
				self.leftSpaceTucheMarker.constant = 230;
			} else {
				self.bottomSpaceTucheMarker.constant = 240;
				self.leftSpaceTucheMarker.constant = 200;
			}
		} else if (beacons.proximity == CLProximityNear) {
			self.heightProgressConstraint.constant = 170;
			color =  UIColorFromRGB(0xcc6633);
			if ([beacons.major integerValue] == 1){
				self.bottomSpaceTucheMarker.constant = 380;
				self.leftSpaceTucheMarker.constant = 230;
			}else {
				self.bottomSpaceTucheMarker.constant = 210;
				self.leftSpaceTucheMarker.constant = 180;
			}
		} else if (beacons.proximity == CLProximityFar) {
			self.heightProgressConstraint.constant = 100;
			color =  UIColorFromRGB(0x406ab2);
			if ([beacons.major integerValue] == 1){
				self.bottomSpaceTucheMarker.constant = 300;
				self.leftSpaceTucheMarker.constant = 230;
			} else {
				self.bottomSpaceTucheMarker.constant = 175;
				self.leftSpaceTucheMarker.constant = 210;
			}
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
	[self performSegueWithIdentifier:@"ChestSegue" sender:nil];
}

- (void)dealloc {
	//[_leftSpaceTucheMarker release];
	//[_heightProgressConstraint release];
	//[super dealloc];
}
@end
