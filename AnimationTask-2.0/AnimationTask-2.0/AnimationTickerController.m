#import "AnimationTickerController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationTickerController ()

@end

@implementation AnimationTickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0.f, 0.f, 150.f, 40.f);
    textLayer.fontSize = 18.f;
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.string = @"Running string!!!";
    textLayer.contentsScale = [[UIScreen mainScreen] scale];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width + textLayer.bounds.size.width, self.view.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(-textLayer.bounds.size.width, self.view.center.y)];
    animation.duration = 5.f;
    animation.repeatCount = HUGE_VALF;
    
    [textLayer addAnimation:animation forKey:nil];
    
    [self.view.layer addSublayer:textLayer];
    
}

@end
