//
//  BlackView.m
//  Btn旋转滚动
//
//  Created by 张东辉 on 2019/7/25.
//  Copyright © 2019 ZDH. All rights reserved.
//

#import "BlackView.h"
#import "ZDH_TableViewCell.h"
#import "Masonry.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface BlackView()<UITableViewDelegate,UITableViewDataSource>
#pragma mark - creat property
@property(nonatomic, strong)UITableView *blackTableView;
@property(nonatomic, strong)UIView *blackBtnView;
@property(nonatomic, strong)UILabel *mainLabel;
@property(nonatomic, strong)NSString *cellStyleStr;
@end
@implementation BlackView
#pragma mark - initWithModel
-(instancetype)initWithViewModel:(Model *)blackModel {
    if (self = [super init]) {
        self.backgroundColor =  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];;
        
        self.cellStyleStr = [[NSString alloc] init];
        self.cellStyleStr = @"left";
        [self initUI];
    }
    
    return self;
}
#pragma mark - init tableView
-(UITableView *)blackTableView {
    if(!_blackTableView) {
        _blackTableView  = [[UITableView  alloc]init];
        _blackTableView.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        _blackTableView.delegate = self;
        _blackTableView.dataSource = self;
        _blackTableView.rowHeight = 70;
        
        
        
    }
    return _blackTableView ;
}
#pragma mark - init UI
-(void)initUI{
    
    self.mainLabel  = [[UILabel alloc]init];
    self.mainLabel.text = @"社区";
    self.mainLabel.textColor = [UIColor whiteColor];
    self.mainLabel.font = [UIFont systemFontOfSize:20];
    self.mainLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *topRightLB = [[UILabel alloc] init];
    topRightLB.textAlignment = NSTextAlignmentRight;
    topRightLB.text = @"...";
    topRightLB.textColor = [UIColor blackColor];
    topRightLB.font = [UIFont boldSystemFontOfSize:30];
    
    
    [self addSubview:topRightLB];
    [self addSubview:self.mainLabel];
    
    
    self.blackBtnView = [[UIView alloc]init];
    self.blackBtnView.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    self.blackBtnView.layer.borderWidth = 0.18f;
    self.blackBtnView.layer.borderColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:0.8].CGColor;
    [self addSubview:self.blackBtnView];
    
    
    [self.blackBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(WIDTH+2, 54));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(94);
    }];
    
    
    [self addSubview:self.blackTableView];
    [self.blackTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(152);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(HEIGHT-152);
    }];
    
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(50);
    }];
    [topRightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(self.mas_top).offset(40);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [self initBtn];
}
#pragma mark - init Btn
-(void)initBtn{
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(21, 0, WIDTH/2-50, 54)];
    
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 54)];
    
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.mainLabel.font = [UIFont systemFontOfSize:20];
    [leftBtn setTitle:@"我要发布" forState:UIControlStateNormal];
    [rightBtn setTitle:@"事件首页" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnDidChange) forControlEvents:UIControlEventTouchDown];
    [rightBtn addTarget:self action:@selector(rightBtnDidChange) forControlEvents:UIControlEventTouchDown];
    leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    [self.blackBtnView addSubview:leftBtn];
    [self.blackBtnView addSubview:rightBtn];
}
#pragma mark - delegate&datasourse
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZDH_TableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Home_TableViewCell"];
    if (!cell) {
        cell = [[ZDH_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Home_TableViewCell"];
    }
    return cell;
}
#pragma mark - Btn 触发方法
-(void)leftBtnDidChange{
    self.cellStyleStr = @"left";
}
-(void)rightBtnDidChange{
    self.cellStyleStr = @"right";
}
@end
