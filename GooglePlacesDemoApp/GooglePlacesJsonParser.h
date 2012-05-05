#import <Foundation/Foundation.h>

@interface GooglePlacesJsonParser : NSObject

- (NSArray *)parseJsonAndReturnPlaces:(NSData *)data;

@end