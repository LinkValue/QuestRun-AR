//
//  LastQuestionViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "LastQuestionViewController.h"

@interface LastQuestionViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *checkmark;

@end

@implementation LastQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapScore:(id)sender {
	[self.checkmark setHidden:NO];
	[self performSelector:@selector(didFinishCheck) withObject:nil afterDelay:0.5];
}

-(void) didFinishCheck{
	[self performSegueWithIdentifier:@"SocialSharingSegue" sender:nil];
}

- (IBAction)didDisplayPhotoCamera:(id)sender {
	[self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)prefersStatusBarHidden {
	return YES;
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
	[_checkmark release];
	[super dealloc];
}
@end
