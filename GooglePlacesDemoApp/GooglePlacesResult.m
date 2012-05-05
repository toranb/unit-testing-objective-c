#import "GooglePlacesResult.h"

@implementation GooglePlacesResult

@synthesize vicinity = _vicinity;
@synthesize name = _name;
@synthesize rating = _rating;

- (NSComparisonResult)sortByRating:(GooglePlacesResult *)item
{
    return [self.rating compare:item.rating];
}

- (NSString *)city
{
    NSRange cityRange = [self.vicinity rangeOfString:@","];
    if (cityRange.location != NSNotFound)
    {
        return [self.vicinity substringWithRange:NSMakeRange(cityRange.location + 2, self.vicinity.length - cityRange.location - 2)];
    }

    return self.vicinity;
}

- (NSString *)address
{
    NSRange addressRange = [self.vicinity rangeOfString:@","];
    if (addressRange.location != NSNotFound)
    {
        return [self.vicinity substringWithRange:NSMakeRange(0, addressRange.location)];
    }
    return self.vicinity;
}

@end