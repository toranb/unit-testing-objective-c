#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GetLocationService : NSObject<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

- (void)determineCurrentLocation;
- (id)initWithLocationManager:(CLLocationManager *)manager;

@end