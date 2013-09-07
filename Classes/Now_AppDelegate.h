//
//  Now_AppDelegate.h
//  Now!
//
//  Created by New User on 9/1/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Now_ViewController;
@class MainView;

@interface Now_AppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet MainView * mainView;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainView * mainView;

@end

