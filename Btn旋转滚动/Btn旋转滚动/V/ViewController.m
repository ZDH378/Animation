//
//  ViewController.m
//  Btn旋转滚动
//
//  Created by 张东辉 on 2019/7/25.
//  Copyright © 2019 ZDH. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "BlackView.h"
#import "WhiteView.h"
#import "Model.h"

#define RECTNAV self.navigationController.navigationBar.frame.size.height;
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
{
    BOOL flag;
}
#pragma mark - creat property
@property (strong, nonatomic) UIImageView *imageView;
@property(nonatomic, strong)UIView *mainView;
@property(nonatomic, strong)BlackView *blackView;
@property(nonatomic, strong)WhiteView *whiteView;
@property(nonatomic, strong)Model *model;
@property(nonatomic, strong)UIButton* gossipBtn;
@property(nonatomic ,assign)NSInteger btnSelectCount;

@end

@implementation ViewController
-(BlackView *) blackView{
    if(!_blackView) {
        _blackView  = [[BlackView  alloc]init];
        
    }
    return _blackView ;
}
-(WhiteView *)whiteView {
    if(!_whiteView) {
        _whiteView  = [[WhiteView alloc]init];
        
    }
    return _whiteView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    flag = YES;
    
    self.btnSelectCount = 0;
    
    
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(-WIDTH, 0,WIDTH*2 , HEIGHT)];
    
    self.mainView.backgroundColor = [UIColor whiteColor];
    self.mainView.clipsToBounds =NO;
    
    
    
    [self.view addSubview:self.mainView];
    
    
    
    [self configMainView];
    [self Btn];
    
    
    
}
- (void)configMainView {
    
    self.blackView = [[BlackView alloc] initWithViewModel:self.model];
    self.blackView.frame = CGRectMake(0,0 , WIDTH, HEIGHT);
    
    self.whiteView = [[WhiteView alloc] initWithViewModel:self.model];
    self.whiteView.frame = CGRectMake(WIDTH,0,WIDTH, HEIGHT);
    [self.mainView addSubview:self.blackView];
    [self.mainView addSubview:self.whiteView];
}
-(void)Btn{
    self.gossipBtn = [[UIButton alloc] init];
    
    //[self.gossipBtn setImage:[UIImage imageNamed:@"taiji"] forState:UIControlStateNormal];
    self.gossipBtn.layer.cornerRadius = 25.0f;
    self.gossipBtn.layer.masksToBounds = YES;
    [self.gossipBtn addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    self.imageView = [[UIImageView alloc] init];
    UIImage *aImage = [UIImage imageNamed:@"taiji"];
    [self.imageView setImage:aImage];
    
    
    
    
    [self.view addSubview:self.gossipBtn];
    [self.view addSubview:self.imageView];
    
    [self.gossipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).offset(103);
    }];
    
    
    
    
}

#pragma mark - conceal navigationbar
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)rotate:(id)sender {
    //
    
    self.btnSelectCount += 1;
    
    if (self.btnSelectCount%2==0) {
        CGPoint accountCenter = self.mainView.center;
        
        
        
        self.mainView.center = accountCenter;
        accountCenter.x -= WIDTH;
        
        
        
        [UITextField animateWithDuration:0.5 animations:^{
            self.mainView.center = accountCenter;
        } completion:nil];
    }else{
        CGPoint accountCenter = self.mainView.center;
        
        self.mainView.center = accountCenter;
        accountCenter.x += WIDTH;
        
        
        [UIView animateWithDuration:0.5 animations:^{
            self.mainView.center = accountCenter;
        } completion:nil];
    }
    
    
    //
    
    if (flag) {
        [UIView animateWithDuration:0.5 animations:^{
            self->_imageView.transform = CGAffineTransformMakeRotation(-M_PI);
        } completion:^(BOOL finished) {
            self->flag = NO;
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self->_imageView.transform = CGAffineTransformMakeRotation(0.0001);
        } completion:^(BOOL finished) {
            self->flag = YES;
        }];
    }
}



@end
