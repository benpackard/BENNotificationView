//
//  BENNotificationDemoController.m
//  BENNotificationViewDemo
//
//  Created by Ben Packard on 4/5/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENNotificationDemoController.h"

//views
#import "BENNotificationView.h"

@interface BENNotificationDemoController ()

@end

@implementation BENNotificationDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	BENNotificationView *notification = [[BENNotificationView alloc] initWithAppName:@"No-Hitter Alert" notificationText:@"Tim Lincenum has pitched 7 hitless innings. Open for TV, Radio, etc." timeStampText:@"now" appIconImage:[UIImage imageNamed:@"NoHitterIcon"]];
//	BENNotificationView *notification = [[BENNotificationView alloc] initWithAppName:@"Ben Packard" notificationText:@"This is a message with multiple lines of text. Truncation will happen on the second line." timeStampText:@"now" appIconImage:[UIImage imageNamed:@"NoHitterIcon"]];
//	BENNotificationView *notification = [[BENNotificationView alloc] initWithAppName:@"Ben Pack" notificationText:@"This is a message with multiple lines of text. Truncation wi" timeStampText:nil appIconImage:[UIImage imageNamed:@"NoHitterIcon"]];

	notification.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:notification];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[notification]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(notification)]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[notification]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(notification)]];
}

@end
