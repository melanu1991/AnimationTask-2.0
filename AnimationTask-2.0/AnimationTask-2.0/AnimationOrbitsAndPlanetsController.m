#import "AnimationOrbitsAndPlanetsController.h"

@interface AnimationOrbitsAndPlanetsController ()

@end

@implementation AnimationOrbitsAndPlanetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *orbitOne = [self createLayerWithWidth:200.f height:200.f position:self.view.center];
    orbitOne.borderWidth = 5.f;
    orbitOne.borderColor = [UIColor redColor].CGColor;
    
    CALayer *planetOne = [self createLayerWithWidth:40.f height:40.f position:CGPointMake(orbitOne.bounds.size.width, orbitOne.bounds.size.height / 2)];
    planetOne.backgroundColor = [UIColor redColor].CGColor;
    
    [orbitOne addSublayer:planetOne];
    
    CABasicAnimation *animationOne = [self createAnimationWithDuration:8.f];
    [orbitOne addAnimation:animationOne forKey:nil];
    
    [self.view.layer addSublayer:orbitOne];
    
    CALayer *orbitTwo = [self createLayerWithWidth:100.f height:100.f position:planetOne.position];
    orbitTwo.borderColor = [UIColor blueColor].CGColor;
    orbitTwo.borderWidth = 5.f;
    
    CALayer *planetTwo = [self createLayerWithWidth:30.f height:30.f position:CGPointMake(orbitTwo.bounds.size.width, orbitTwo.bounds.size.height / 2)];
    planetTwo.backgroundColor = [UIColor blueColor].CGColor;
    
    [orbitTwo addSublayer:planetTwo];
    
    CABasicAnimation *animationTwo = [self createAnimationWithDuration:4.f];
    [orbitTwo addAnimation:animationTwo forKey:nil];
    
    [orbitOne addSublayer:orbitTwo];
    
    CALayer *orbitThree = [self createLayerWithWidth:50.f height:50.f position:planetTwo.position];
    orbitThree.borderColor = [UIColor grayColor].CGColor;
    orbitThree.borderWidth = 5.f;
    
    CALayer *planetThree = [self createLayerWithWidth:15.f height:15.f position:CGPointMake(orbitThree.bounds.size.width, orbitThree.bounds.size.height / 2)];
    planetThree.backgroundColor = [UIColor grayColor].CGColor;
    
    [orbitThree addSublayer:planetThree];
    
    CABasicAnimation *animationThree = [self createAnimationWithDuration:2.f];
    [orbitThree addAnimation:animationThree forKey:nil];
    
    [orbitTwo addSublayer:orbitThree];
    
}

- (CABasicAnimation *)createAnimationWithDuration:(CGFloat)duration {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:(360 * M_PI) / 180];
    animation.repeatCount = HUGE_VALF;
    return animation;
}

- (CALayer *)createLayerWithWidth:(CGFloat)width height:(CGFloat)height position:(CGPoint)position {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0.f, 0.f, width, height);
    layer.position = position;
    layer.cornerRadius = width / 2;
    return layer;
}

@end
