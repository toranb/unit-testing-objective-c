#import "GooglePlacesServiceTests.h"
#import "GooglePlacesResult.h"
#import "GooglePlacesService.h"
#import "OCMockObject.h"
#import "GooglePlacesJsonParser.h"
#import "OCMockRecorder.h"
#import "OCMArg.h"

@implementation GooglePlacesServiceTests

@synthesize sut = _sut;
@synthesize data = _data;
@synthesize places = _places;
@synthesize mockParser = _mockParser;

- (void)setUp
{
    self.places = [NSArray arrayWithObjects:nil];
    self.data = [@"foo" dataUsingEncoding:NSUTF8StringEncoding];
    self.mockParser = [OCMockObject mockForClass:[GooglePlacesJsonParser class]];
    self.sut = [[GooglePlacesService alloc] initWithParser:self.mockParser];
}

- (void)testSortsParsedJsonPlaces
{
    id mockSut = [OCMockObject partialMockForObject:self.sut];
    [[[mockSut expect] andReturn:nil] sortPlacesByRating:[OCMArg any]];
    [[[self.mockParser stub] andReturn:self.places] parseJsonAndReturnPlaces:[OCMArg any]];
    [self.sut callbackWithHttpResponse:self.data];
    [mockSut verify];
}

- (void)testParsesWebServiceResponseAndSortsData
{
    [[[self.mockParser expect] andReturn:self.places] parseJsonAndReturnPlaces:self.data];
    [self.sut callbackWithHttpResponse:self.data];
    [self.mockParser verify];
}

- (void)testSortPlacesByRating
{
    GooglePlacesResult *first = [[GooglePlacesResult alloc] init];
    GooglePlacesResult *last = [[GooglePlacesResult alloc] init];
    first.rating = (NSDecimalNumber *) [NSDecimalNumber numberWithDouble:1.1];
    last.rating = (NSDecimalNumber *) [NSDecimalNumber numberWithDouble:1.2];
    NSArray *unsorted = [NSArray arrayWithObjects:last, first, nil];

    NSArray *sorted = [self.sut sortPlacesByRating:unsorted];
    GooglePlacesResult *firstResult = [sorted objectAtIndex:0];
    GooglePlacesResult *lastResult = [sorted objectAtIndex:1];
    STAssertEqualObjects(first, firstResult, @"");
    STAssertEqualObjects(last, lastResult, @"");
}

@end