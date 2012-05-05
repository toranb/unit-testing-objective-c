#import <Foundation/Foundation.h>

@class GooglePlacesJsonParser;

@interface GooglePlacesService : NSObject

@property (strong, nonatomic) GooglePlacesJsonParser *parser;

- (NSArray *)sortPlacesByRating:(NSArray *)places;
- (void)callbackWithHttpResponse:(NSData *)data;
- (id)initWithParser:(GooglePlacesJsonParser *)parser;

@end