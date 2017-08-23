//
//  YQButton.m
//  testBTN
//
//  Created by problemchild on 2017/8/10.
//  Copyright © 2017年 FreakyYang. All rights reserved.
//

#import "GCButton.h"

@interface GCButton ()<CAAnimationDelegate>{
    CAShapeLayer *shapeLayer;
}

@end

@implementation GCButton



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
     [self addTarget:self action:@selector(touchedDown:event:) forControlEvents:UIControlEventTouchDown];
    return self;
}

-(void)touchedDown:(UIButton *)btn event:(UIEvent *)event{
     [shapeLayer removeFromSuperlayer];
    UITouch *touch = event.allTouches.allObjects.firstObject;
    CGPoint touchePoint = [touch locationInView:btn];
    CGFloat maxX = touchePoint.x>(self.frame.size.width-touchePoint.x)?touchePoint.x:(self.frame.size.width-touchePoint.x);
    CGFloat maxY = touchePoint.y>(self.frame.size.width-touchePoint.y)?touchePoint.y:(self.frame.size.height-touchePoint.y);
    CGFloat circleWidth = maxX>maxY?maxX:maxY;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-circleWidth, -circleWidth, circleWidth*2, circleWidth*2) cornerRadius:circleWidth];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.opacity = 0.5;
    shapeLayer.lineWidth = 0.f;
     shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer.position = touchePoint;
    shapeLayer.path = [path CGPath];
    shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
    shapeLayer.strokeColor = [[UIColor clearColor] CGColor];
    [self.layer addSublayer:shapeLayer];
    self.layer.masksToBounds = YES;
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    scaleAnimation.duration = self.AnimationDuration?self.AnimationDuration:0.5;
    scaleAnimation.delegate = self;
    [shapeLayer addAnimation:scaleAnimation forKey:@"animation"];

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
         [shapeLayer removeFromSuperlayer];
    }
}


@end
