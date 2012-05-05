#import <SenTestingKit/SenTestingKit.h>

@class GooglePlacesService;

@interface GooglePlacesServiceTests : SenTestCase

@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSArray *places;
@property (strong, nonatomic) GooglePlacesService *sut;
@property (weak, nonatomic) id mockParser;

@end