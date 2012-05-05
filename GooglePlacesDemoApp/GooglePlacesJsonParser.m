#import "GooglePlacesJsonParser.h"
#import "GooglePlacesResult.h"

@implementation GooglePlacesJsonParser

- (NSArray *)parseJsonAndReturnPlaces:(NSData *)data
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *items = [json objectForKey:@"results"];

    NSMutableArray *places = [NSMutableArray array];
    for (NSDictionary *item in items)
    {
        GooglePlacesResult *place = [[GooglePlacesResult alloc] init];
        place.name = [item objectForKey:@"name"];
        place.rating = [item objectForKey:@"rating"];
        place.vicinity = [item objectForKey:@"vicinity"];

        [places addObject:place];
    }

    return places;
}
@end