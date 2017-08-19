#import "AnimationButtonsController.h"

@interface AnimationButtonsController ()

@property (weak, nonatomic) IBOutlet UIButton *scaleButton;
@property (weak, nonatomic) IBOutlet UIButton *garbageButton;
@property (weak, nonatomic) IBOutlet UIImageView *garbageImage;

@end

@implementation AnimationButtonsController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)scaleButtonPressed:(UIButton *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithFloat:1.f];
    animation.toValue = [NSNumber numberWithFloat:2.f];
    animation.repeatCount = 1;
    animation.duration = 1.f;
    [self.scaleButton.layer addAnimation:animation forKey:nil];
}

- (IBAction)garbageButtonPressed:(UIButton *)sender {
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath, nil, self.garbageButton.center.x, self.garbageButton.center.y);
    CGPathAddQuadCurveToPoint(thePath, nil, self.view.center.x - self.garbageImage.bounds.size.width, self.view.center.y + self.garbageImage.bounds.size.height, self.garbageImage.bounds.size.width / 2, self.garbageImage.frame.origin.y);
    moveAnimation.path = thePath;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:CGFLOAT_MIN];
    
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.animations = [NSArray arrayWithObjects:scaleAnimation, moveAnimation, nil];
    
    [self.garbageButton.layer addAnimation:group forKey:nil];
    
}

@end
