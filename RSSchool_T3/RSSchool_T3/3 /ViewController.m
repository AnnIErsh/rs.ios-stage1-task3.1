#import "ViewController.h"

@interface UIColor (Converter)
+ (NSString *)hexStringFromColor:(UIColor *)color;
@end

@interface ViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
@end

@implementation ViewController

#pragma mark - UI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityIdentifier = @"mainView";
    [self addLabelResultColor];
    [self addLabelRed];
    [self addLabelGreen];
    [self addLabelBlue];
    [self addViewResultColor];
    [self addTextFieldRed];
    [self addTextFieldGreen];
    [self addTextFieldBlue];
    [self addButtonProcess];
    
    for (id i in self.view.subviews)
    {
        if ([i isMemberOfClass:[UITextField class]])
        {
            [self addDelegates:i];
            [i addTarget:self
                  action:@selector(placeFocus)
        forControlEvents: UIControlEventEditingDidBegin];
           // [i resignFirstResponder];
        }
    }
    
    [self subscribeOnKeyboardEvents];
}

- (void)addLabelResultColor {
    CGRect labelRect = CGRectMake(30, 100, 100, 40);
    self.labelResultColor = [[UILabel alloc] initWithFrame:labelRect];
    self.labelResultColor.text = @"Color";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    [self.view addSubview:self.labelResultColor];
}

- (void)addLabelRed {
    CGRect labelRect = CGRectMake(self.labelResultColor.frame.origin.x, self.labelResultColor.frame.origin.y + 60, 60, 40);
    self.labelRed = [[UILabel alloc] initWithFrame:labelRect];
    self.labelRed.text = @"RED";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    [self.view addSubview:self.labelRed];
}

- (void)addLabelGreen {
    CGRect labelRect = CGRectMake(self.labelRed.frame.origin.x, self.labelRed.frame.origin.y + 60, 60, 40);
    self.labelGreen = [[UILabel alloc] initWithFrame:labelRect];
    self.labelGreen.text = @"GREEN";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    [self.view addSubview:self.labelGreen];
}

- (void)addLabelBlue {
    CGRect labelRect = CGRectMake(self.labelGreen.frame.origin.x, self.labelGreen.frame.origin.y + 60, 60, 40);
    self.labelBlue = [[UILabel alloc] initWithFrame:labelRect];
    self.labelBlue.text = @"BLUE";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    [self.view addSubview:self.labelBlue];
}

- (void)addViewResultColor {
    CGRect viewRect = CGRectMake(self.labelResultColor.frame.origin.x + self.labelResultColor.frame.size.width + 10, self.labelResultColor.frame.origin.y, self.view.frame.size.width / 2 + 10, 40);
    self.viewResultColor = [[UIView alloc] initWithFrame:viewRect];
    self.viewResultColor.backgroundColor = UIColor.clearColor;
    self.viewResultColor.layer.borderWidth = 0.6;
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    [self.view addSubview:self.viewResultColor];
}

- (void)addTextFieldRed {
    CGRect textViewRect = CGRectMake(self.labelRed.frame.origin.x + self.labelRed.frame.size.width + 10, self.labelRed.frame.origin.y, self.viewResultColor.frame.size.width + 40, 40);
    self.textFieldRed = [[UITextField alloc] initWithFrame:textViewRect];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldRed.textColor = UIColor.lightGrayColor;
    self.textFieldRed.layer.borderWidth = 0.6;
    self.textFieldRed.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textFieldRed.layer.cornerRadius = 6;
    self.textFieldRed.alpha = 0.9;
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    [self.view addSubview:self.textFieldRed];
}

- (void)addTextFieldGreen {
    CGRect textViewRect = CGRectMake(self.labelGreen.frame.origin.x + self.labelGreen.frame.size.width + 10, self.labelGreen.frame.origin.y, self.textFieldRed.frame.size.width, 40);
    self.textFieldGreen = [[UITextField alloc] initWithFrame:textViewRect];
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldGreen.textColor = UIColor.lightGrayColor;
    self.textFieldGreen.layer.borderWidth = 0.6;
    self.textFieldGreen.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textFieldGreen.layer.cornerRadius = 6;
    self.textFieldGreen.alpha = 0.9;
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    [self.view addSubview:self.textFieldGreen];
}

- (void)addTextFieldBlue {
    CGRect textViewRect = CGRectMake(self.labelBlue.frame.origin.x + self.labelBlue.frame.size.width + 10, self.labelBlue.frame.origin.y, self.textFieldRed.frame.size.width, 40);
    self.textFieldBlue = [[UITextField alloc] initWithFrame:textViewRect];
    self.textFieldBlue.placeholder = @"0..255";
    self.textFieldBlue.textColor = UIColor.lightGrayColor;
    self.textFieldBlue.layer.borderWidth = 0.6;
    self.textFieldBlue.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textFieldBlue.layer.cornerRadius = 6;
    self.textFieldBlue.alpha = 0.9;
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    [self.view addSubview:self.textFieldBlue];
}

- (void)addButtonProcess {
    float x = (self.view.frame.size.width - 100) / 2;
    CGRect buttonRect = CGRectMake(x, self.textFieldBlue.frame.origin.y + self.textFieldBlue.frame.size.height + 10, 100, 44);
    self.buttonProcess = [[UIButton alloc] initWithFrame:buttonRect];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [self.buttonProcess addTarget:self
                           action:@selector(buttonTapped:)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
}
#pragma mark - functionality
- (void)buttonTapped:(id)sender {
    NSLog(@"Button Tap Tap Tap");
    [self changeLabelResultColor];
    for (id i in self.view.subviews)
    {
        if ([i isMemberOfClass:[UITextField class]])
            [self cleanPlaceholders:i];
    }
}

- (void)addDelegates:(UITextField *)sender {
    sender.delegate = self;
}

- (void)cleanPlaceholders:(UITextField*)sender {
    sender.text = @"";
}

- (void)changeLabelResultColor {
        
    [self toBeMixed];
    if (![self.errorMessage isEqualToString:@"no"])
    {
        
        self.labelResultColor.text = [UIColor hexStringFromColor: self.mixedcolor];
        [self.viewResultColor setBackgroundColor: self.mixedcolor];
    }
    else
    {
        self.labelResultColor.text = @"Error";
        [self.viewResultColor setBackgroundColor:UIColor.clearColor];
    }
}

- (void)setRedColor {
    self.red = [[NSString alloc] initWithString:self.textFieldRed.text];
}

- (void)setGreenColor {
    self.green = [[NSString alloc] initWithString:self.textFieldGreen.text];
}

- (void)setBlueColor {
    self.blue = [[NSString alloc] initWithString:self.textFieldBlue.text];
}

- (UIColor *)toBeMixed {
    [self setRedColor];
    [self setGreenColor];
    [self setBlueColor];
    
    if ([self checkInputs:self.red] == NO || [self checkInputs:self.green ] == NO || [self checkInputs:self.blue] == NO)
        self.errorMessage = @"no";
    int r = self.red.intValue;
    int g = self.green.intValue;
    int b = self.blue.intValue;
    if ([self checkValue:r] == YES && [self checkValue:g] == YES && [self checkValue:b] == YES)
        self.mixedcolor = [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1];
    else
    {
        self.mixedcolor = UIColor.clearColor;
        self.errorMessage = @"no";
    }
    
    for (id i in self.view.subviews)
    {
        if ([i isMemberOfClass:[UITextField class]])
            [i resignFirstResponder];
    }
    
    return self.mixedcolor;
}

- (BOOL)checkValue:(int)i {
    if (i < 0 || i > 255)
        return NO;
    return YES;
}

- (void)placeFocus {

    if ([self.labelResultColor.text  isEqualToString: @"Error"])
    {
        self.labelResultColor.text = @"Color";
        self.errorMessage = @"ok";
        NSLog(@"HAHA ERROR");
    }
    else
    {
        
        if (![self.labelResultColor.text  isEqualToString: @"Color"])
            self.labelResultColor.text = @"Color";
        NSLog(@"focus is placed");
        
    }
}

- (BOOL)checkInputs:(NSString *)string {
    if ([string isEqualToString:@""])
        return NO;
    NSCharacterSet *numericSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:string];
    
    if ([numericSet isSupersetOfSet: stringSet])
        return YES;
    
    return NO;
}

@end


#pragma mark - keyboardEvents
@implementation ViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(buttonTapped:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}
@end

#pragma mark - uicolor to hex
@implementation UIColor (Converter)

+ (NSString *)hexStringFromColor:(UIColor *)color {
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 1;

    if (color)
        [color getRed:&r green:&g blue:&b alpha:&a];
    
    return [NSString stringWithFormat:@"0x%02lX%02lX%02lX", lroundf(r * 255.0), lroundf(g * 255.0), lroundf(b * 255.0)];
}
@end
