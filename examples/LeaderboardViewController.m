//
//  LeaderboardViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "LeaderboardViewController.h"

@interface LeaderboardViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation LeaderboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self performSelector:@selector(didTapDelay) withObject:nil afterDelay:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
