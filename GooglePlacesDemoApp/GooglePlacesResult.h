#import <Foundation/Foundation.h>

@interface GooglePlacesResult : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDecimalNumber *rating;
@property (strong, nonatomic) NSString *vicinity;

- (NSString *)city;
- (NSString *)address;

@end