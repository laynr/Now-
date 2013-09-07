#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CoreLocation/CLLocation.h" //added
#import "CoreLocation/CLLocationManager.h" //added
#import "CoreLocation/CLLocationManagerDelegate.h" //added

@interface MainView : UIView <UIPickerViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate>  { //added CLLocationManagerDelegate
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *theCategory;
    IBOutlet UILabel *theID;
    IBOutlet UILabel *theLat;
    IBOutlet UILabel *theLng;
	IBOutlet UITextField *textField;
    IBOutlet UIActivityIndicatorView *theSpiner;
    IBOutlet UILabel *theStatus;
	UIPickerView *myPicker;
	NSArray *pickerArray;
	CLLocationManager *locmanager; //added
	BOOL locationObtained;
	BOOL firstRun;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIPickerView *myPicker;
@property (nonatomic, retain) NSArray *pickerArray;
@property (nonatomic, retain) UITextField *textField;

- (IBAction)doNothing; //
- (IBAction)loadView;
- (IBAction)post:(id)sender;
- (IBAction)search:(id)sender;
@end
