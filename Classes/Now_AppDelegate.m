//
//  Now_AppDelegate.m
//  Now!
//
//  Created by New User on 9/1/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "Now_AppDelegate.h"
#import "MainView.h"

@implementation Now_AppDelegate;

@synthesize window, mainView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	// Override point for customization after app launch	

	[mainView loadView];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[mainView release];
	[window release];
	[super dealloc];
}


@end
