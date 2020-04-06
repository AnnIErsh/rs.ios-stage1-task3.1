#import <Foundation/Foundation.h>

@interface PolynomialConverter : NSObject

@property (strong, nonatomic) NSMutableArray *mutableArray;
@property (strong, nonatomic) NSNumber *power;
@property (strong, nonatomic) NSMutableString *polynom;
@property (nonatomic) BOOL val;

- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers;
- (NSString*)insertPower:(NSNumber*)power andSignOf:(NSString*)element;

@end



