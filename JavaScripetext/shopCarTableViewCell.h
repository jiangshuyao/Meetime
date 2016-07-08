//
//  shopCarTableViewCell.h
//  JavaScripetext
//
//  Created by Rongheng on 16/4/23.
//  Copyright © 2016年 Rongheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^btnClickBlock)(void);

@interface shopCarTableViewCell : UITableViewCell

{
    int number;
}
@property (nonatomic,strong)UILabel *nameLable;
@property (nonatomic,strong)UILabel *numberLable;
@property (nonatomic,strong)UIButton *addButton;
@property (nonatomic,strong)UIButton *subtractButton;
@property (nonatomic,strong)UILabel  *line;
@property (nonatomic,strong)NSDictionary *dic;
@property (nonatomic,assign)NSInteger index;


@property (nonatomic,copy)void(^addClickBlock)(NSInteger index,NSString *clickStr,int numberBox);
@property (nonatomic,copy)btnClickBlock;

- (void)disPlayCellWithMessage:(NSInteger)str;

@end
