#import "Combinator.h"

@implementation Combinator

- (float)numerator:(int)n {
    float res = n;
    
    for (float i = 1; i < self.diff; i++)
        res = res * (n - i);
    
    return res;
}

- (float)factorial:(int)i {
    
    if (i == 1 ||i == 0)
        return 1;
    else if (i < 0 )
        return -1;
    
    return i * [self factorial: i - 1];
}

-(void)setK:(float)k {
    if (k == 11)
        _k = 0;
    else
        _k = _k + 1;
}

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {

    if (self.diff < 0)
    {
        [self setK:11];
        return nil;
    }
    else
        [self setK:0];

    float combinations = [array objectAtIndex:0].floatValue;
    float objects = [array objectAtIndex:1].floatValue;
    self.diff = 0;
    
    
    if (self.k < objects - self.k)
        self.diff = self.k;
    else
        self.diff = objects - self.k;
    
    float n = [self numerator:objects];
    float m = [self factorial:self.diff];
    float result = n / m;
    
    if (result != combinations)
        [self chechChooseFromArray:array];

    NSNumber *res = [NSNumber new];
    
    if (self.k == 0)
        res = nil;
    else
        res = @(self.k);
        
    return res;
}
@end
