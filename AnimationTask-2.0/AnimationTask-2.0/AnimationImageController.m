#import "AnimationImageController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationImageController () <CAAnimationDelegate>

@property (strong, nonatomic) NSArray *images;

@end

@implementation AnimationImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *oneImage = [UIImage imageNamed:@"oneImage.jpg"];
    UIImage *twoImage = [UIImage imageNamed:@"twoImage.png"];
    self.images = @[oneImage, twoImage];
    
    CALayer *oneLayer = [self createLayerWithImage:oneImage startPoint:0.f startPointContents:0.f];
    CALayer *twoLayer = [self createLayerWithImage:oneImage startPoint:self.view.bounds.size.width / 4.f startPointContents:0.25f];
    CALayer *threeLayer = [self createLayerWithImage:oneImage startPoint:self.view.bounds.size.width / 2.f startPointContents:0.5f];
    CALayer *fourLayer = [self createLayerWithImage:oneImage startPoint:self.view.bounds.size.width / 4.f + self.view.bounds.size.width / 2.f startPointContents:0.75f];

    [self.view.layer addSublayer:oneLayer];
    [self.view.layer addSublayer:twoLayer];
    [self.view.layer addSublayer:threeLayer];
    [self.view.layer addSublayer:fourLayer];
    
    CALayer *oneLayer1 = [self createLayerWithImage:twoImage startPoint:0.f startPointContents:0.f];
//    CALayer *twoLayer2 = [self createLayerWithImage:twoImage startPoint:self.view.bounds.size.width / 4.f startPointContents:0.25f];
//    CALayer *threeLayer3 = [self createLayerWithImage:twoImage startPoint:self.view.bounds.size.width / 2.f startPointContents:0.5f];
//    CALayer *fourLayer4 = [self createLayerWithImage:twoImage startPoint:self.view.bounds.size.width / 4.f + self.view.bounds.size.width / 2.f startPointContents:0.75f];
    
//    CABasicAnimation *animationOne = [self createAnimationWithBeginTime:CACurrentMediaTime() + 1.f];
//    [oneLayer addAnimation:animationOne forKey:nil];
//    
//    CABasicAnimation *animationTwo = [self createAnimationWithBeginTime:CACurrentMediaTime() + 2.f];
//    [twoLayer addAnimation:animationTwo forKey:nil];
//    
//    CABasicAnimation *animationThree = [self createAnimationWithBeginTime:CACurrentMediaTime() + 3.f];
//    [threeLayer addAnimation:animationThree forKey:nil];
//    
//    CABasicAnimation *animationFour = [self createAnimationWithBeginTime:CACurrentMediaTime() + 4.f];
//    [fourLayer addAnimation:animationFour forKey:nil];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.duration = 4.f;
    transition.beginTime = CACurrentMediaTime() + 1.f;
    [oneLayer addAnimation:transition forKey:nil];
    
    oneLayer.contents = [self createLayerWithImage:twoImage startPoint:0.f startPointContents:0.f].contents;
    
}

- (CABasicAnimation *)createAnimationWithBeginTime:(CFTimeInterval)beginTime {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.f];
    animation.toValue = [NSNumber numberWithFloat:0.f];
    animation.duration = 4.f;
    [animation setBeginTime:beginTime];
    [animation setDelegate:self];
    return animation;
}

- (CALayer *)createLayerWithImage:(UIImage *)image startPoint:(CGFloat)startPoint startPointContents:(CGFloat)startPointContents {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(startPoint, 0.f, self.view.bounds.size.width / 4.f, self.view.bounds.size.height);
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    layer.contentsRect = CGRectMake(startPointContents, 0.f, 0.25f, 1.f);
    return layer;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"stop!");
}

@end
