#import <UIKit/UiKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void)print;
- (void)setTo:(int)n over:(int)d;
- (Fraction *)add:(Fraction *)f;
- (Fraction *)substract:(Fraction *)f;
- (Fraction *)multiply:(Fraction *)f;
- (Fraction *)divide:(Fraction *)f;
- (void)reduce;
- (double)convertToNum;
- (NSString *)convertToString;

@end
