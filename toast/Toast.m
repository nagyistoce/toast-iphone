#import "Toast.h"

@implementation Toast

@synthesize text;

+ (void)makeText:(NSString *)text duration:(int)duration
{
    Toast *t = [[Toast alloc] init];
    t.text = text;
    UIResponder<UIApplicationDelegate> *ad = [UIApplication sharedApplication].delegate;
    [ad.window addSubview:t.view];
    
    CGRect rect = t.view.frame;
    rect.origin.y = 360;
    t.view.frame = rect;
    t.view.alpha = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    t.view.alpha = 1;
    [UIView commitAnimations];
    
    [t performSelector:@selector(hideToast) withObject:t afterDelay:duration];
}

- (id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}

- (void)hideToast
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
    self.view.alpha = 0;
    [UIView commitAnimations];
}

- (void)animDone:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context
{
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lblText.text = text;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
