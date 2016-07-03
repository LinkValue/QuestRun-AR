//
//  PresentViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "PresentViewController.h"
#import "AFSoundManager.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	AFSoundItem *item = [[AFSoundItem alloc] initWithLocalResource:@"win.wav" atPath:nil];
	AFSoundPlayback *player = [[AFSoundPlayback alloc] initWithItem:item];
	[player play];
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

@end
