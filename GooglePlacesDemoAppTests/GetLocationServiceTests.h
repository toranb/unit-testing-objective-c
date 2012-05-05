#import <SenTestingKit/SenTestingKit.h>

@class GetLocationService;

@interface GetLocationServiceTests : SenTestCase

@property (strong, nonatomic) GetLocationService* sut;
@property (strong, nonatomic) id mockCLLocationManager;

@end