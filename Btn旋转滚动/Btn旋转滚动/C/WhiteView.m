//
//  WhiteView.m
//  Btn旋转滚动
//
//  Created by ZDH on 2019/7/25.
//  Copyright © 2019 ZDH. All rights reserved.
//

#import "WhiteView.h"
#import "Masonry.h"
#import "ZDH_TableViewCell.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface WhiteView()<UITableViewDelegate,UITableViewDataSource>
#pragma mark - creat property
@property(nonatomic, strong)UITableView *whiteTableView;
@property(nonatomic, strong)UILabel *mainLabel;
@property(nonatomic, strong)UIView *whiteBtnView;
@property(nonatomic, strong)NSString *cellStyleStr;
@end
@implementation WhiteView

-(instancetype)initWithViewModel:(Model *)whiteModel {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.cellStyleStr = [[NSString alloc] init];
        self.cellStyleStr = @"left";
        [self initUI];
    }
    return self;
}
-(UITableView *)whiteTableView {
    if(!_whiteTableView) {
        _whiteTableView  = [[UITableView  alloc]init];
        _whiteTableView.backgroundColor = [UIColor whiteColor];
        _whiteTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _whiteTableView.delegate = self;
        _whiteTableView.dataSource = self;
        _whiteTableView.rowHeight = 170;
        
    }
    return _whiteTableView ;
}
-(void)initUI{
    
    
    self.mainLabel  = [[UILabel alloc]init];
    self.mainLabel.text = @"社区";
    self.mainLabel.textColor = [UIColor blackColor];
    self.mainLabel.font = [UIFont systemFontOfSize:20];
    self.mainLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *topRightLB = [[UILabel alloc] init];
    topRightLB.textAlignment = NSTextAlignmentRight;
    topRightLB.text = @"...";
    topRightLB.textColor = [UIColor blackColor];
    topRightLB.font = [UIFont boldSystemFontOfSize:30];
    
    
    [self addSubview:topRightLB];
    [self addSubview:self.mainLabel];
    
    
    self.whiteBtnView = [[UIView alloc]init];
    self.whiteBtnView.backgroundColor = [UIColor whiteColor];
    self.whiteBtnView.layer.borderWidth = 0.18f;
    self.whiteBtnView.layer.borderColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:0.8].CGColor;
    [self addSubview:self.whiteBtnView];
    
    
    [self.whiteBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(WIDTH+2, 54));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(94);
    }];
    
    [self addSubview:self.whiteTableView];
    
    [self.whiteTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   ZDH_TableViewCell  *cell= [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell = [[ZDH_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    return cell;
}
#pragma mark - init Btn
-(void)initBtn{
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(21, 0, WIDTH/2-50, 54)];
    
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 54)];
    
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.mainLabel.font = [UIFont systemFontOfSize:20];
    [leftBtn setTitle:@"普通问答" forState:UIControlStateNormal];
    [rightBtn setTitle:@"悬赏问答" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnDidChange) forControlEvents:UIControlEventTouchDown];
    [rightBtn addTarget:self action:@selector(rightBtnDidChange) forControlEvents:UIControlEventTouchDown];
    
    
    [self.whiteBtnView addSubview:leftBtn];
    [self.whiteBtnView addSubview:rightBtn];
}
#pragma mark - Btn 触发方法
-(void)leftBtnDidChange{
    self.cellStyleStr = @"left";
}
-(void)rightBtnDidChange{
    self.cellStyleStr = @"right";
}
@end
