#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)animationButtonsPressed:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"AnimationOne"] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"AnimationTwo"] animated:YES];
            break;
        default:
            break;
    }
}

@end
