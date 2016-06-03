//
//  ViewController.m
//  DanmuDemo
//
//  Created by 张冬冬 on 16/6/3.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textfield;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,assign)BOOL isVip;
@property (nonatomic,strong)UIView *v;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.isVip = YES;
    
    _textfield =[[UITextField alloc]initWithFrame:CGRectMake(100, 400, 200, 30)];
    
    _textfield.backgroundColor = [UIColor whiteColor];
    _textfield.textColor = [UIColor blackColor];
    _textfield.layer.borderColor = [UIColor redColor].CGColor;
    _textfield.layer.borderWidth = 1.0;
    _textfield.delegate = self;
    [self.view addSubview:_textfield];
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(120, 450, 70, 30)];
    _button.backgroundColor = [UIColor yellowColor];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button setTitle:@"会员" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    v.backgroundColor = [UIColor lightGrayColor];
    v.tag = 1;
    self.v = v;
    [self.view addSubview:self.v];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UILabel *lab = [[UILabel alloc]init];
    [self.view addSubview:lab];
    
    if (_isVip) {
        lab.textColor = [UIColor redColor];
    }else{
        lab.textColor = [UIColor blackColor];
    }
    
    lab.text = self.textfield.text;
    self.textfield.text = nil;
    [lab sizeToFit];
    
    CGFloat w = lab.bounds.size.width;
    CGFloat h = lab.bounds.size.height;
    CGFloat x = [UIScreen mainScreen].bounds.size.width;
    CGFloat y = arc4random_uniform([UIScreen mainScreen].bounds.size.height - h);
    
    lab.frame = CGRectMake(x, y, w, h);
    
    [UIView animateWithDuration:5 animations:^{
        lab.frame = CGRectMake(-w, y, w, h);
    }];
    
    return YES;
}

- (void)click:(UIButton *)sender{
    if (self.isVip) {
        self.isVip = NO;
        [sender setTitle:@"非会员" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor lightGrayColor]];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"会员" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor yellowColor]];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.isVip = YES;
    }
    
    
    //视图动画缩放
    CGFloat x = self.v.frame.origin.x;
    CGFloat y = self.v.frame.origin.y;
    
    if (self.v.tag == 1) {
        [UIView animateWithDuration:3 animations:^{
            self.v.frame = CGRectMake(x, y, 100, 100);
        }];
        self.v.tag = 0;
    }else{
        [UIView animateWithDuration:3 animations:^{
            self.v.frame = CGRectMake(x, y, 50, 50);
        }];
        self.v.tag = 1;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
