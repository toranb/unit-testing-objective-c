#import "OCMockObject.h"
#import "GetLocationServiceTests.h"
#import "GetLocationService.h"
#import <objc/runtime.h>

static BOOL locationServicesEnabledMockResult = NO;

@implementation GetLocationServiceTests

@synthesize sut = _sut;
@synthesize mockCLLocationManager = _mockCLLocationManager;

- (void)setUp
{
    self.mockCLLocationManager = [OCMockObject niceMockForClass:[CLLocationManager class]];
    self.sut = [[GetLocationService alloc] initWithLocationManager:self.mockCLLocationManager];
    [self swapOutLocationServicesClass];
}

-(void)tearDown
{
    locationServicesEnabledMockResult = NO;
    [self resetLocationServicesClass];
    [super tearDown];
}

- (void)testDoesNotStartUpdatingLocationInvokedWhenLocationServicesEnabledButAuthorizationStatusDenied
{
    locationServicesEnabledMockResult = YES;
    [[self.mockCLLocationManager expect] startUpdatingLocation];
    [self.sut determineCurrentLocation];
    [self.mockCLLocationManager verify];
}

- (void)testDoesNotStartUpdatingLocationInvokedWhenLocationServicesDisabledAndAuthorizationStatusNotDetermined
{
    locationServicesEnabledMockResult = NO;
    [[self.mockCLLocationManager reject] startUpdatingLocation];
    [self.sut determineCurrentLocation];
    [self.mockCLLocationManager verify];
}

- (void)swapOutLocationServicesClass
{
    method_exchangeImplementations(
        class_getClassMethod([CLLocationManager class], @selector(locationServicesEnabled)),
        class_getClassMethod([self class], @selector(locationServicesEnabledMock))
    );
}

- (void)resetLocationServicesClass
{
    method_exchangeImplementations(
        class_getClassMethod([self class], @selector(locationServicesEnabledMock)),
        class_getClassMethod([CLLocationManager class], @selector(locationServicesEnabled))
    );
}

+ (BOOL)locationServicesEnabledMock {
    return locationServicesEnabledMockResult;
}

@end