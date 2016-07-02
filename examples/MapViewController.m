//
//  MapViewController.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "MapViewController.h"

@interface MapViewController ()
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTucheMarker;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.bottomSpaceTucheMarker.constant = 170;
	
	[UIView animateWithDuration:1 animations:^{
		[self.view layoutIfNeeded];
	}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
	[_bottomSpaceTucheMarker release];
	[super dealloc];
}
@end
