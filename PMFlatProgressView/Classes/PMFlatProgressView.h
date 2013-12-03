//
//  PMFlatProgressView.h
//  PMFlatProgressView
//
//  Created by Taku Inoue on 2013/11/28.
//  Copyright (c) 2013年 Peromasamune. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PMFlatProgressViewCompletionBlock)(BOOL completed);

@interface PMFlatProgressView : UIView

@property UIColor *progressBackgroundColor;
@property UIColor *borderColor;

@property (assign) CGFloat borderWidth;
@property NSArray *colorArray;

@property (assign,readonly) float progress;
@property (assign) CGFloat cornerRadius;

-(void)setProgress:(float)progress duration:(NSTimeInterval)duration block:(PMFlatProgressViewCompletionBlock)block;

@end
