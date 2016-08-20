//
//  CustomerSearchBar.m
//  秋大爷要的搜索框
//
//  Created by 刘智滨 on 16/8/21.
//  Copyright © 2016年 刘智滨. All rights reserved.
//

#define LEFTSPACE 5

#import "CustomerSearchBar.h"

@implementation CustomerSearchBar

//-(void)awakeFromNib {
//    [super awakeFromNib];
//    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shousuo"]];
//    iv.bounds = CGRectMake(0, 0, 20, 20);
//    self.leftView = iv;
//    self.leftViewMode = UITextFieldViewModeUnlessEditing;
//    UIColor *color = [UIColor whiteColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"搜索你感兴趣的",nil) attributes:@{NSForegroundColorAttributeName: color}];
//    self.textColor = [UIColor whiteColor];
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//}

//-(instancetype)init {
//    if (self = [super init]) {
//        UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shousuo"]];
//        iv.bounds = CGRectMake(0, 0, 20, 20);
//        self.leftView = iv;
//        self.leftViewMode = UITextFieldViewModeUnlessEditing;
//        UIColor *color = [UIColor whiteColor];
//        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"搜索你感兴趣的",nil) attributes:@{NSForegroundColorAttributeName: color}];
//        self.textColor = [UIColor whiteColor];
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    }
//    return self;
//}
//
//-(CGRect)leftViewRectForBounds:(CGRect)bounds {
//    [super leftViewRectForBounds:bounds];
//    CGRect leftIconRect = [super leftViewRectForBounds:bounds];
//    //计算字的长度
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
//    CGRect rect = CGRectZero;
//    if (![self.text isEqualToString:@""]) {
//        rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height)
//                                       options:NSStringDrawingUsesLineFragmentOrigin
//                                    attributes:attribute
//                                       context:nil];
//        leftIconRect.origin.x += self.bounds.size.width * 0.5 - rect.size.width * 0.5 - leftIconRect.size.width;// 右偏
//        return leftIconRect;
//    }else {
//        rect = [self.placeholder boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height)
//                                              options:NSStringDrawingUsesLineFragmentOrigin
//                                           attributes:attribute
//                                              context:nil];
//        leftIconRect.origin.x += self.bounds.size.width * 0.5 - rect.size.width * 0.75;// 右偏
//        return leftIconRect;
//    }
//}
//
//-(CGRect)placeholderRectForBounds:(CGRect)bounds
//{
//    CGRect inset = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
//    return inset;
//}
//
//- (CGRect)textRectForBounds:(CGRect)bounds {
//    CGRect inset = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
//    return inset;
//}
//
//- (CGRect)textRectForBounds:(CGRect)bounds {
//    CGRect inset = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
//    return inset;
//}

//这里用于给定一个输入字的偏移值
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(LEFTSPACE, 0, bounds.size.width, bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(LEFTSPACE, 0, bounds.size.width, bounds.size.height);
    return inset;
}



@end
