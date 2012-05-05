#import "GooglePlacesService.h"
#import "GooglePlacesJsonParser.h"

@implementation GooglePlacesService

@synthesize parser = _parser;

- (id)initWithParser:(GooglePlacesJsonParser *)parser
{
    if (self == [super init]) {
        self.parser = parser;
    }

    return self;
}

- (id)init
{
    return [self initWithParser:nil];
}

- (void)callbackWithHttpResponse:(NSData *)data
{
    NSArray *unsorted = [self.parser parseJsonAndReturnPlaces:data];
    NSArray *sorted = [self sortPlacesByRating:unsorted];
    //do something w/ the sorted places
}

- (NSArray *)sortPlacesByRating:(NSArray *)places
{
    return [places sortedArrayUsingSelector:@selector(sortByRating:)];
}

@end