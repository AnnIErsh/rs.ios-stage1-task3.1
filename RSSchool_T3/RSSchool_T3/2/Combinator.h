#import <Foundation/Foundation.h>

@interface Combinator : NSObject
@property (nonatomic) float k;
@property (nonatomic) float diff;
- (float)numerator:(int)n;
- (float)factorial:(int)i;
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array;
@end


