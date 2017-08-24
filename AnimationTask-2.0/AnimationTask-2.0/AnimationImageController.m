#import "AnimationImageController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationImageController () <CAAnimationDelegate>

@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSArray *layers;
@property (strong, nonatomic) UIImage *currentImage;

@end

@implementation AnimationImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(switchButtonPressed:)];
    self.navigationItem.rightBarButtonItem = actionButton;
    
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
    
    self.currentImage = oneImage;
    self.layers = @[oneLayer, twoLayer, threeLayer, fourLayer];

}

- (void)switchButtonPressed:(UIBarButtonItem *)barButton {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.duration = 3.f;
    
    NSUInteger indexImage = [self.images indexOfObject:self.currentImage];
    UIImage *image = self.images[(indexImage + 1) % 2];
    self.currentImage = image;
    
    CALayer *oneLayer = self.layers[0];
    CALayer *twoLayer = self.layers[1];
    CALayer *threeLayer = self.layers[2];
    CALayer *fourLayer = self.layers[3];
    
    [oneLayer setContents:[self createLayerWithImage:image startPoint:0.f startPointContents:0.f].contents];
    [twoLayer setContents:[self createLayerWithImage:image startPoint:0.f startPointContents:0.f].contents];
    [threeLayer setContents:[self createLayerWithImage:image startPoint:0.f startPointContents:0.f].contents];
    [fourLayer setContents:[self createLayerWithImage:image startPoint:0.f startPointContents:0.f].contents];
    
    [oneLayer addAnimation:transition forKey:nil];
    [twoLayer addAnimation:transition forKey:nil];
    [threeLayer addAnimation:transition forKey:nil];
    [fourLayer addAnimation:transition forKey:nil];
    
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
