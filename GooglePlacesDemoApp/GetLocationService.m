#import "GetLocationService.h"

@implementation GetLocationService

@synthesize locationManager = _locationManager;

- (id)initWithLocationManager:(CLLocationManager *)locationManager
{
    if (self == [super init]) {
        self.locationManager = locationManager;
        self.locationManager.delegate = self;
    }

    return self;
}

- (id)init
{
    return [self initWithLocationManager:nil];
}

- (void)determineCurrentLocation
{
    if ([CLLocationManager locationServicesEnabled])
    {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self.locationManager stopUpdatingLocation];
    //do something w/ the newLocation
}

@end