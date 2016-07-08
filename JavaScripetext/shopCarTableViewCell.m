//
//  shopCarTableViewCell.m
//  JavaScripetext
//
//  Created by Rongheng on 16/4/23.
//  Copyright © 2016年 Rongheng. All rights reserved.
//

#import "shopCarTableViewCell.h"

@implementation shopCarTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].applicationFrame.size.width, self.frame.size.height);
        self.contentView.frame=CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, [UIScreen mainScreen].applicationFrame.size.width, self.contentView.frame.size.height);
        //[self initCellView];
        
    }
    return self;
}
- (void)initCellView
{
    _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    _nameLable.textAlignment = 1;
    _nameLable.textColor = [UIColor orangeColor];
    _nameLable.font = [UIFont systemFontOfSize:18];
    [self addSubview:_nameLable];
    
    _line = [[UILabel alloc] initWithFrame:CGRectMake(10, 68, self.contentView.frame.size.width-20, 1)];
    _line.backgroundColor = [UIColor blackColor];
    [self addSubview:_line];
    
    _subtractButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _subtractButton.frame = CGRectMake(250, 20, 25, 25);
    [_subtractButton setImage:[UIImage imageNamed:@"less_s"] forState:UIControlStateNormal];
    [_subtractButton addTarget:self action:@selector(subtractClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_subtractButton];
    
    
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addButton.frame = CGRectMake(320, 20, 25, 25);
    [_addButton setImage:[UIImage imageNamed:@"plus_s"] forState:0];
    [_addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
    
    _numberLable = [[UILabel alloc] initWithFrame:CGRectMake(275, 20, 40, 20)];
    _numberLable.backgroundColor = [UIColor orangeColor];
    _numberLable.textAlignment = 1;
    [self addSubview:_numberLable];
}
- (void)subtractClick
{
    NSLog(@"----");
    number--;
    _numberLable.text = [NSString stringWithFormat:@"%d",number];
    [self setNuusder];
    [self hide];
    [self getNUmberOfBox];
}
- (void)addClick
{
    NSLog(@"+++++");
    number++;
    [self hide];
    _numberLable.text = [NSString stringWithFormat:@"%d",number];
    [self setNuusder];
    [self getNUmberOfBox];
}
- (void)getNUmberOfBox
{
    
    NSString *str = @"add";
    NSUserDefaults *box = [NSUserDefaults standardUserDefaults];
    int numboxt = 0;
    for (int i = 0; i<20; i++) {
        NSString *ud = [box objectForKey:[NSString stringWithFormat:@"%d",i]];
        numboxt+=[ud intValue];
    }
    if (_addClickBlock) {
        _addClickBlock(_index,str,numboxt);
    }
}

- (void)disPlayCellWithMessage:(NSInteger)str
{
    [self initCellView];
    _nameLable.text = [NSString stringWithFormat:@"This is %ld",(long)str];
    _index = str;
    [self getNumberBox];
    _numberLable.text = [NSString stringWithFormat:@"%d",number];
}
- (void)getNumberBox
{
    NSString *indexNum = [NSString stringWithFormat:@"%ld",(long)_index];
    NSUserDefaults *numberDef = [NSUserDefaults standardUserDefaults];
    NSString *numStr = [numberDef objectForKey:indexNum];
    number = 0;
    if (numStr == nil) {
        number = 0;
    } else {
        number = [numStr intValue];
    }
    [self hide];
    NSLog(@"number==%d",number);
}
- (void)hide
{
    if (number == 0) {
        _subtractButton.hidden = YES;
        _numberLable.hidden = YES;
    } else {
        _subtractButton.hidden = NO;
        _numberLable.hidden = NO;
    }

}

- (void)setNuusder
{
    NSString *indexNum = [NSString stringWithFormat:@"%ld",(long)_index];
    NSUserDefaults *numberDef = [NSUserDefaults standardUserDefaults];
    NSString *numberBoe = [NSString stringWithFormat:@"%d",number];
    [numberDef setObject:numberBoe forKey:indexNum];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
