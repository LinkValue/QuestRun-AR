//
//  ChestDiscoverViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "ChestDiscoverViewController.h"
#import "AFSoundManager.h"

@interface ChestDiscoverViewController ()

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ChestDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	NSMutableArray *images = [NSMutableArray new];
	AFSoundItem *item = [[AFSoundItem alloc] initWithLocalResource:@"tresurechest.wav" atPath:nil];
	AFSoundPlayback *player = [[AFSoundPlayback alloc] initWithItem:item];
	[player play];
	for (int i = 0; i < 74; i++){
		[images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"coffre_2_%d", i]]];
	}
	self.imageView.animationImages = images;
	self.imageView.animationDuration = 3;
	self.imageView.animationRepeatCount = 1;
	[self.imageView startAnimating];
	
	[self performSelector:@selector(didFinishAnimating) withObject:nil afterDelay:3];
	
}

-(void) didFinishAnimating{
	[self performSegueWithIdentifier:@"QuestionSegue" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)prefersStatusBarHidden {
	return YES;
}

- (void)dealloc {
	[_imageView release];
	[super dealloc];
}
@end
