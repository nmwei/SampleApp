//
//  GTSearchBar.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/17.
//

#import "GTSearchBar.h"
#import "GTScreen.h"

@interface GTSearchBar()<UITextFieldDelegate>

@property(nonatomic, strong, readwrite) UITextField *textField;

@end

@implementation GTSearchBar

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(UI(10), UI(5), frame.size.width - UI(10) * 2, frame.size.height - UI(5) * 2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeUnlessEditing;
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";
            _textField;
        
        })];
    }
    return self;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"");
};
         
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"");
};

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
};

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder];
    return YES;
};

@end
