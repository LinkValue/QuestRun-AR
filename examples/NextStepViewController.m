//
//  NextStepViewController.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "NextStepViewController.h"

@interface NextStepViewController ()
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *flecheLeftConstraint;
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *treasureRightConstraint;
@property (retain, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation NextStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.clipsToBounds = YES;
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

-(void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.flecheLeftConstraint.constant = 20;
	self.treasureRightConstraint.constant = 13;
	[UIView animateWithDuration:1.5 animations:^{
		[self.view layoutIfNeeded];
	}];
}
- (IBAction)didTapBackButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
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
	[_flecheLeftConstraint release];
	[_treasureRightConstraint release];
	[_backButton release];
	[super dealloc];
}
@end
