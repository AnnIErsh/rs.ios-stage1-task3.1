#import "PolynomialConverter.h"

@implementation PolynomialConverter

-(void)setPolynom:(NSMutableString *)polynom {
    if (!_polynom)
        _polynom = polynom;
    else
        [_polynom appendString:polynom];
}

-(void)setVal:(BOOL)val {
    if (val == NO)
        _val = YES;
}

- (NSString*)insertPower:(NSNumber*)power andSignOf:(NSString*)element{
    NSMutableString *str = [NSMutableString new];
    NSMutableString *s = element.mutableCopy;
    if (s.intValue == 0)
    {
        str = [NSMutableString stringWithFormat:@""];
        return str;
    }
    
    if (power.intValue == 0)
    {
        if (element.intValue > 0)
            [s insertString:@" + " atIndex:0];
        else
            [s insertString:@" " atIndex:1];
        return s;
    }

    if (power.intValue <= 1)
    {
        if (power.intValue == 1 && s.intValue != 0)
            str = [NSMutableString stringWithFormat:@"x"];
    }
    else
        str = [NSMutableString stringWithFormat:@"x^%@", power];
    if (element.intValue > 0)
    {
        [str insertString:[NSString stringWithFormat:@" + %@", element] atIndex:0];
    }
    if (element.intValue < 0)
    {
        [s insertString:@" " atIndex:1];
        if (element.intValue == -1)
            [str insertString:@" - " atIndex:0];
        else
            [str insertString:[NSString stringWithFormat:@" %@", s.copy] atIndex:0];
    }
    return str;
}

- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if (numbers.count == 0)
        return self.polynom.copy;
    
    NSMutableString *element = [numbers firstObject].stringValue.mutableCopy;
    self.mutableArray = numbers.mutableCopy;
    self.power = @(self.mutableArray.count - 1);
    NSString *str = [self insertPower:self.power andSignOf:element];
    [self setPolynom:str.mutableCopy];
    self.power = @(self.power.unsignedIntValue - 1);
    
    if (!self.mutableArray)
        return self.polynom.copy;
    
    while (self.mutableArray.count != 0) {
        [self.mutableArray removeObjectAtIndex:0];
        [self convertToStringFrom:self.mutableArray];
    }
    
    NSMutableString *result = [NSMutableString new];
    result = self.polynom;
    if (_val == NO)
        [result replaceCharactersInRange:NSMakeRange(0, 3) withString:@""];
    [self setVal:NO];
    return result.copy;
}
@end

