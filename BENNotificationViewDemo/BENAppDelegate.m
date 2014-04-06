//
//  BENAppDelegate.m
//  BENNotificationViewDemo
//
//  Created by Ben Packard on 4/5/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENAppDelegate.h"

//controllers
#import "BENNotificationDemoController.h"

@implementation BENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	BENNotificationDemoController *controller = [[BENNotificationDemoController alloc] initWithNibName:nil bundle:nil];
	self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
