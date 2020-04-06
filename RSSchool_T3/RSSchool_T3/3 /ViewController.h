#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property UIView * viewResultColor;

@property UIButton * buttonProcess;

@property (nonatomic) UILabel * labelRed;
@property (nonatomic) UILabel * labelGreen;
@property (nonatomic) UILabel * labelBlue;
@property (nonatomic) UILabel * labelResultColor;

@property (nonatomic) UITextField * textFieldRed;
@property (nonatomic) UITextField * textFieldBlue;
@property (nonatomic) UITextField * textFieldGreen;

@property (nonatomic) UIColor * mixedcolor;
@property (nonatomic) NSString * red;
@property (nonatomic) NSString * green;
@property (nonatomic) NSString * blue;

@property (nonatomic) NSString * errorMessage;

- (void)buttonTapped:(id)sender;
- (void)cleanPlaceholders:(UITextField*)sender;
- (void)addDelegates:(UITextField *)sender;
- (void)changeLabelResultColor;
- (BOOL)checkInputs:(NSString *)string;

@end

