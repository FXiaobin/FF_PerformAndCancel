//
//  ViewController.m
//  Perform
//
//  Created by mac on 2018/12/25.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic,strong) UIButton *button;


@property (nonatomic,strong) UIView *maskView;

@property (nonatomic,assign) BOOL isClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.button];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self showMaskView];
    [self performSelector:@selector(hiddenMaskView) withObject:nil afterDelay:4.0 inModes:@[NSRunLoopCommonModes]];
    
}

-(void)showAction:(UIButton *)sender{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    _isClick = !_isClick;
    
    if (_isClick) {
        [self showMaskView];
        [self performSelector:@selector(hiddenMaskView) withObject:nil afterDelay:4.0 inModes:@[NSRunLoopCommonModes]];
        
    }else{
        [self performSelector:@selector(hiddenMaskView) withObject:nil afterDelay:0.0 inModes:@[NSRunLoopCommonModes]];
    }
    
    
}

-(void)showMaskView{
    _isClick = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.hidden = NO;
        self.maskView.alpha = 1.0;
    }completion:^(BOOL finished) {
        
    }];
}

-(void)hiddenMaskView{
    _isClick = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha = 0.0;
    }completion:^(BOOL finished) {
        self.maskView.hidden = YES;
    }];
}

-(UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width, 100)];
        _maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _maskView.hidden = YES;
    }
    return _maskView;
}


-(UIButton *)button{
    if (_button == nil) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        _button.backgroundColor = [UIColor orangeColor];
        [_button addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}

@end
