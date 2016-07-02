//
//  CountDownViewController.m
//  Club Med
//
//  Created by Christopher Saez on 02/07/2016.
//
//

#import "CountDownViewController.h"
#define MAX_COUNTDOWN_IMAGES 100
#define DURATION 2
@interface CountDownViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *countDownImageView;

@end

@implementation CountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self.navigationController setNavigationBarHidden:YES animated:NO];
	
	NSMutableArray *images = [NSMutableArray new];
	for (int i = 0; i < MAX_COUNTDOWN_IMAGES; i++){
		[images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"decompte_1_%d", i]]];
	}
	self.countDownImageView.animationImages = images;
	self.countDownImageView.animationDuration = DURATION;
	self.countDownImageView.animationRepeatCount = 1;
	[self.countDownImageView startAnimating];
	
	[self performSelector:@selector(didFinishAnimation) withObject:nil afterDelay:3];
}

-(void)didFinishAnimation{
	[self performSegueWithIdentifier:@"ShowMapSegue" sender:nil];
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
	[_countDownImageView release];
	[super dealloc];
}
@end
