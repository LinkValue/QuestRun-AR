//
//  SocialSharingViewController.m
//  Club Med
//
//  Created by Christopher Saez on 03/07/2016.
//
//

#import "SocialSharingViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface SocialSharingViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation SocialSharingViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

- (IBAction)didTapShare:(id)sender {
	
	AudioServicesPlaySystemSound (1108);
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
	
	
	[self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - image picker delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *) info {
	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	
	
	[picker dismissViewControllerAnimated:YES completion:^{
		
		NSString *text = @"La chasse aux tresors gagnée par @LinkValue au #clubmedhackathon !!!!!!";
		
		NSArray *itemsToShare = @[text, chosenImage];
		UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
		activityVC.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
			AudioServicesPlaySystemSound (1016);
			[self performSegueWithIdentifier:@"LeaderboardSegue" sender:nil];
		};
		[self presentViewController:activityVC animated:YES completion:nil];
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

@end
