#import <UIKit/UIKit.h>

@interface Toast : UIViewController
{
    IBOutlet UILabel *lblText;
    NSString *text;
}

@property (nonatomic, retain) NSString *text;

+ (void)makeText:(NSString *)text duration:(int)duration;

@end
