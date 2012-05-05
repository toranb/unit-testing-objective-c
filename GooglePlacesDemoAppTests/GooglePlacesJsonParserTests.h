#import <SenTestingKit/SenTestingKit.h>

@class GooglePlacesJsonParser;

@interface GooglePlacesJsonParserTests : SenTestCase

@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) GooglePlacesJsonParser *sut;

@end