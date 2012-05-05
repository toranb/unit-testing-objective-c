#import "GooglePlacesJsonParserTests.h"
#import "GooglePlacesJsonParser.h"
#import "GooglePlacesResult.h"

@implementation GooglePlacesJsonParserTests

@synthesize data = _data;
@synthesize sut = _sut;

- (void)setUp
{
    NSString *json = @"{\"html_attributions\":[\"x\"],\"results\":[{\"geometry\":{\"location\":{\"lat\":-33.8719830,\"lng\":151.1990860}},\"icon\":\"restaurant-71.png\",\"id\":\"idx\",\"name\":\"nx\",\"rating\":3.90,\"reference\":\"rzx\",\"types\":[\"tx\"],\"vicinity\":\"vcx\"},{\"geometry\":{\"location\":{\"lat\":-39.8999990,\"lng\":151.1666660}},\"icon\":\"restaurant-72.png\",\"id\":\"idxx\",\"name\":\"nxx\",\"rating\":2.20,\"reference\":\"rzxx\",\"types\":[\"txx\"],\"vicinity\":\"vcxx\"}]}";
    self.data = [json dataUsingEncoding:NSUTF8StringEncoding];
    self.sut = [[GooglePlacesJsonParser alloc] init];
}

- (void)testHydratesPlaceNameFromJsonData
{
    NSArray *places = [self.sut parseJsonAndReturnPlaces:self.data];
    GooglePlacesResult *result = [places objectAtIndex:0];
    STAssertEqualObjects(@"nx", result.name, @"");
}

- (void)testHydratesPlaceRatingFromJsonData
{
    NSArray *places = [self.sut parseJsonAndReturnPlaces:self.data];
    GooglePlacesResult *result = [places objectAtIndex:0];
    STAssertEqualObjects([NSDecimalNumber numberWithDouble:3.90], result.rating, @"");
}

- (void)testHydratesPlaceVicinityFromJsonData
{
    NSArray *places = [self.sut parseJsonAndReturnPlaces:self.data];
    GooglePlacesResult *result = [places objectAtIndex:0];
    STAssertEqualObjects(@"vcx", result.vicinity, @"");
}

@end