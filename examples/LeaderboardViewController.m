//
//  LeaderboardViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "LeaderboardViewController.h"
#import "AFSoundManager.h"

@interface LeaderboardViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation LeaderboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
	self.imageview.userInteractionEnabled = YES;
	[self.imageview addGestureRecognizer:tap];
	AFSoundItem *item = [[AFSoundItem alloc] initWithLocalResource:@"winner.mp3" atPath:nil];
	AFSoundPlayback *player = [[AFSoundPlayback alloc] initWithItem:item];
	[player play];
}

-(void) didTap{
	[self performSegueWithIdentifier:@"CadeauSegue" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
	[_imageview release];
	[super dealloc];
}
@end
