#import "MainView.h"

@implementation MainView

@synthesize myPicker, pickerArray, imageView, textField;

- (IBAction)doNothing {
}

- (IBAction)loadView {
	
	firstRun = TRUE;
	UIDevice *myCurrentDevice = [UIDevice currentDevice];
	
	theID.text = [myCurrentDevice uniqueIdentifier];
	
	locationObtained = FALSE;
	textField.delegate = self;  ///added for keyboard
	[theSpiner startAnimating];
    locmanager = [[CLLocationManager alloc] init];  //added
	locmanager.distanceFilter = 100;
	locmanager.desiredAccuracy = kCLLocationAccuracyBest;
    [locmanager setDelegate: self];   //added
    [locmanager startUpdatingLocation];   //added
	
	imageView.image = [UIImage imageNamed:@"Speech_bubble.png"];
	theCategory.text = @"All";
	
	//pickerArray = [[NSArray arrayWithObjects:@"All", @"Event", @"Me", nil] retain];
	
	myPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 245.0, 0.0, 0.0)];
	myPicker.delegate = self;
	myPicker.showsSelectionIndicator = YES;
	
	[self addSubview:myPicker];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	
    if (theTextField == textField) {
		
        [textField resignFirstResponder];
		
    }
	
    return YES;
	
}

// Called when the location is updated
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	NSDate* eventDate = newLocation.timestamp;
	NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	if (abs(howRecent) < 5.0 ) {
		NSString *lat = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude ];
		NSString *lng = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude ];    
		theLat.text = lat;
		theLng.text = lng;
		[theSpiner stopAnimating];	
		[theSpiner removeFromSuperview];
		if (firstRun) {
			theStatus.text = @"         Location obtained!           Pick category, write and post                     Or pick category and search                                                                                                    .";
			
		}
		firstRun = FALSE;
		locationObtained = TRUE;
		
	} else {
		//theStatus.text = @"Unable to locate you.  Try again later.";
	}	
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error  //added
{
	[locmanager startUpdatingLocation];   //added
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	//return [pickerArray count];
	return 13;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	NSString *title = nil;
	if (row == 1) {
		title = @"Activism";
	}
	if (row == 0) {
		title = @"All";
	}
	if (row == 2) {
		title = @"Carpool";
	}
	if (row == 3) {
		title = @"Event";
	}
	if (row == 4) {
		title = @"Fish & Game";
	}
	if (row == 5) {
		title = @"Free";
	}
	if (row == 6) {
		title = @"Join Me";
	}
	//if (row == 7) {
	//	title = @"Me";
	//}
	if (row == 7) {
		title = @"Merchandise";
	}
	if (row == 8) {
		title = @"Nature";
	}
	if (row == 9) {
		title = @"News";
	}
	if (row == 10) {
		title = @"Party";
	}
	if (row == 11) {
		title = @"People";
	}
	if (row == 12) {
		title = @"Traffic";
	}

	return title;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	switch (row) 
	{
		case 1:
		{
			theCategory.text = @"Activism";
			if (locationObtained){
			theStatus.text = @"Protest                               Demonstration               Rioting                   ";
			}
			break;
		}
		case 0:
		{
			//imageView.image = [UIImage imageNamed:@"Speech_bubble.png"];
			theCategory.text = @"All";
			if (locationObtained){
			theStatus.text = @"Returns all items going on Now!";
			}
			break;
		}
		case 2:
		{
			theCategory.text = @"Carpool";
			if (locationObtained){
			theStatus.text = @"Driver: going north                        Passenger: going west                 New York or bust!     ";
			}
			break;
		}
		case 3:
		{
			theCategory.text = @"Event";
			if (locationObtained){
			theStatus.text = @"Street performer                         Ladies' night                       Extra tickets        ";
			}
			break;
		}
		case 4:
		{
			theCategory.text = @"FishGame";
			if (locationObtained){
			theStatus.text = @"8 Point Deer                     100lb Sturgeon             Decoy              ";
			}
			break;
		}	
		case 5:
		{
			theCategory.text = @"Free";
			if (locationObtained){
			theStatus.text = @"Food                                       Free samples                     Couch u-haul           ";
			}
			break;
		}
		case 6:
		{
			theCategory.text = @"JoinMe";
			if (locationObtained){
			theStatus.text = @"Tennis anyone?                      Golf?                      Basketball?";
			}
			break;
		}
//		case 7:
//		{
//			theCategory.text = @"Me";
//			if (locationObtained){
//			theStatus.text = @"Search only your items going on Now!";
//			}
//			break;
//		}
		case 7:
		{
			theCategory.text = @"Merchandise";
			if (locationObtained){
			theStatus.text = @"Clearance sale                                Wii - got mine, 2 left    Garage Sale";
			}
			break;
		}
		case 8:
		{
			theCategory.text = @"Nature";
			if (locationObtained){
			theStatus.text = @"Migration                                      Tornado                        Plants in bloom ";
			}
			break;
		}
		case 9:
		{
			theCategory.text = @"News";
			if (locationObtained){
			theStatus.text = @"Car Chase                                           Fire                                Military crackdown     ";
			}
			break;
		}
		case 10:
		{
			theCategory.text = @"Party";
			if (locationObtained){
			theStatus.text = @"College Party                         Tailgate                           Tupperware party       ";
			}
			break;
		}
		case 11:
		{
			theCategory.text = @"People";  
			if (locationObtained){
			theStatus.text = @"Celebrity sighting                                      Politician                           Rock star               ";
			}
			break;
		}
		case 12:
		{
			theCategory.text = @"Traffic";
			if (locationObtained){
			theStatus.text = @"Accident                           Speed Trap               Construction    ";
			}
				break;
		}
			
	}
	
	
}


- (IBAction)post:(id)sender {
	if (locationObtained){
		
		[locmanager stopUpdatingLocation];
		NSString *alt = @"1";
		NSString *tags = @"version1";
		NSString *deviceID = theID.text;
		NSString *name = textField.text;
		NSString *description = theCategory.text;
		NSString *lat = theLat.text;
		NSString *lng = theLng.text;
		
	
		NSString *urlEncodedName = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)name, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
		NSString *mystring = [NSString stringWithFormat: @"http://now1.scoutic.com/gen/request?operation=add;alt=%@;tag=%@;userId=%@;name=%@;description=%@;lat=%@&lng=%@",alt,tags,deviceID,urlEncodedName,description,lat,lng];
		NSString *urlEncodedURL = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)mystring, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
		NSString *finalUrl = [NSString stringWithFormat: @"maps://maps.google.com/maps?f=q&hl=en&geocode=&q=%@",urlEncodedURL];	
		NSURL *url = [NSURL URLWithString:finalUrl];
	
		[[UIApplication sharedApplication] openURL:url];  
		}
		else{
			//theStatus.text = @"Wait till location found";
		}
	    
}

- (IBAction)search:(id)sender {
	if (locationObtained){
		[locmanager stopUpdatingLocation];
		NSString *alt = @"2";
		NSString *tags = @"version1";
		NSString *deviceID = theID.text;
		NSString *name = @"search";
		NSString *description = theCategory.text;
		NSString *lat = theLat.text;
		NSString *lng = theLng.text;
		
	
		NSString *urlEncodedName = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)name, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
		NSString *mystring = [NSString stringWithFormat: @"http://now1.scoutic.com/gen/request?operation=add;alt=%@;tag=%@;userId=%@;name=%@;description=%@;lat=%@&lng=%@",alt,tags,deviceID,urlEncodedName,description,lat,lng];
		NSString *urlEncodedURL = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)mystring, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
		NSString *finalUrl = [NSString stringWithFormat: @"maps://maps.google.com/maps?f=q&hl=en&geocode=&q=%@",urlEncodedURL];
		NSURL *url = [NSURL URLWithString:finalUrl];
	
		[[UIApplication sharedApplication] openURL:url];  
		}
		else{
			//theStatus.text = @"Wait till location found";
		}
    
}

- (void) dealloc
{
	[myPicker release];
	[textField release];
	[pickerArray release];
	[imageView release];
	[super dealloc];
}
@end
