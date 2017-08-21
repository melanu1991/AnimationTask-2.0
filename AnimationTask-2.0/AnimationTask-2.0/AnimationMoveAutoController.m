#import "AnimationMoveAutoController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationMoveAutoController ()

@end

@implementation AnimationMoveAutoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, self.view.bounds.size.width / 2, 100.f);
    CGPathAddQuadCurveToPoint(path, nil, self.view.bounds.size.width / 4, (self.view.bounds.size.height / 2 - 100.f) / 2 + 100.f, self.view.bounds.size.width / 2, self.view.bounds.size.height / 2.f);
    CGPathAddQuadCurveToPoint(path, nil, self.view.bounds.size.width / 2.f + self.view.bounds.size.width / 4.f, self.view.bounds.size.height / 2 + ((self.view.bounds.size.height / 2.f - 100.f) / 2.f), self.view.bounds.size.width / 2, self.view.bounds.size.height - 100.f);
    CGPathAddQuadCurveToPoint(path, nil, self.view.bounds.size.width / 4.f, self.view.bounds.size.height / 2 + ((self.view.bounds.size.height / 2.f - 100.f) / 2.f), self.view.bounds.size.width / 2.f, self.view.bounds.size.height / 2.f);
    CGPathAddQuadCurveToPoint(path, nil, self.view.bounds.size.width / 4 + self.view.bounds.size.width / 2.f, (self.view.bounds.size.height / 2 - 100.f) / 2 + 100.f, self.view.bounds.size.width / 2.f, 100.f);
    
    CAShapeLayer *road = [CAShapeLayer layer];
    road.path = path;
    road.lineJoin = kCALineJoinRound;
    road.lineCap = kCALineCapRound;
    road.fillColor = [UIColor clearColor].CGColor;
    road.strokeColor = [UIColor blackColor].CGColor;
    road.lineWidth = 20.f;
    [self.view.layer addSublayer:road];
    
    CAShapeLayer *centerRoad = [CAShapeLayer layer];
    centerRoad.path = path;
    centerRoad.fillColor = [UIColor clearColor].CGColor;
    centerRoad.strokeColor = [UIColor whiteColor].CGColor;
    centerRoad.lineWidth = 3.f;
    centerRoad.lineDashPattern = @[@2, @4];
    [self.view.layer addSublayer:centerRoad];
    
    CALayer *car = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"car"];
    car.frame = CGRectMake(0.f, 0.f, 60, 30);
    car.contents = (__bridge id _Nullable)(image.CGImage);
    car.position = CGPointMake(self.view.bounds.size.width / 2, 100.f);
    [self.view.layer addSublayer:car];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.repeatCount = HUGE_VALF;
    animation.duration = 6.f;
    [car addAnimation:animation forKey:nil];
    
}

@end
