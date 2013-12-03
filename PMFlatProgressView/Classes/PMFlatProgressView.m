//
//  PMFlatProgressView.m
//  PMFlatProgressView
//
//  Created by Taku Inoue on 2013/11/28.
//  Copyright (c) 2013年 Peromasamune. All rights reserved.
//

#import "PMFlatProgressView.h"

#define kPMFlatProgressDefaultCornerRadius 10
#define kPMFlatProgressDefaultBorderWidth 3
#define PMFlatProgressBackgroundDefaultColor [UIColor colorWithWhite:0.6 alpha:1.0];
#define PMFlatProgressBorderLineDefaultColor [UIColor blackColor];

@interface PMFlatProgressView()
@property CAShapeLayer *innerProgressLayer;
@property CAGradientLayer *gradientLayer;
@property (assign) float duration;
@property (copy) PMFlatProgressViewCompletionBlock block;
@end

@implementation PMFlatProgressView

@synthesize progressBackgroundColor = progressBackgroundColor_;
@synthesize borderColor = borderColor_;
@synthesize borderWidth = borderWidth_;
@synthesize colorArray = colorArray_;
@synthesize progress = progress_;
@synthesize cornerRadius = cornerRadius_;
@synthesize innerProgressLayer = innerProgressLayer_;
@synthesize gradientLayer = gradientLayer_;
@synthesize duration = duration_;
@synthesize block = block_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        progressBackgroundColor_ = PMFlatProgressBackgroundDefaultColor;
        borderColor_ = PMFlatProgressBorderLineDefaultColor;
        borderWidth_ = kPMFlatProgressDefaultBorderWidth;
        cornerRadius_ = kPMFlatProgressDefaultCornerRadius;
        colorArray_ = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor, nil];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CALayer *backgroundLayer = [CALayer layer];
    
    backgroundLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    backgroundLayer.backgroundColor = progressBackgroundColor_.CGColor;
    backgroundLayer.cornerRadius = cornerRadius_;
    backgroundLayer.borderColor = borderColor_.CGColor;
    backgroundLayer.borderWidth = borderWidth_;
    backgroundLayer.masksToBounds = YES;
    
    [self.layer addSublayer:backgroundLayer];
}

#pragma mark -- Class Method --

-(void)setProgress:(float)progress duration:(NSTimeInterval)duration block:(PMFlatProgressViewCompletionBlock)block{
    progress_ = progress;
    duration_ = duration;
    block_ = block;
    
    [self layoutInnerProgressLayer];
    [self startProgressAnimation];
}

#pragma mark -- Private Method --

-(void)layoutInnerProgressLayer{
    
    if (!innerProgressLayer_) {
        innerProgressLayer_ = [CAShapeLayer layer];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(borderWidth_, self.frame.size.height/2, self.frame.size.width - borderWidth_ * 2, 0)];
    
    innerProgressLayer_.path = path.CGPath;
    innerProgressLayer_.fillColor = [UIColor clearColor].CGColor;
    innerProgressLayer_.strokeColor = [UIColor colorWithWhite:1.000 alpha:0.5].CGColor;
    innerProgressLayer_.lineWidth = self.frame.size.height - borderWidth_ * 2;
    
    if (!gradientLayer_) {
        gradientLayer_ = [CAGradientLayer layer];
    }
    gradientLayer_.frame = self.bounds;
    gradientLayer_.colors = colorArray_;
    gradientLayer_.cornerRadius = cornerRadius_;
    gradientLayer_.masksToBounds = YES;
    [gradientLayer_ setMask:innerProgressLayer_];
    [self.layer addSublayer:gradientLayer_];
}

-(void)startProgressAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = duration_;
    animation.repeatCount = 0;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:progress_*0.5];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [innerProgressLayer_ addAnimation:animation forKey:@"progressAnimation"];
}

#pragma mark -- CAAnimationDelegate --

-(void)animationDidStart:(CAAnimation *)anim{
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (!block_) {
        block_(YES);
    }
}

@end
