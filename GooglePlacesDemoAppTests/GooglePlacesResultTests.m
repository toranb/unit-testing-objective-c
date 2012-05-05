#import "GooglePlacesResultTests.h"
#import "GooglePlacesResult.h"

@implementation GooglePlacesResultTests

@synthesize sut = _sut;

- (void)setUp
{
    self.sut = [[GooglePlacesResult alloc] init];
    self.sut.vicinity = @"400 Main St, Des Moines IA";
}

- (void)testReturnsAddressFromVicinity
{
    STAssertEqualObjects(self.sut.address, @"400 Main St", @"");
}

- (void)testReturnsCityFromVicinity
{
    STAssertEqualObjects(self.sut.city, @"Des Moines IA", @"");
}

@end