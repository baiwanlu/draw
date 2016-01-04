//
//  HYRecordView.h
//  AiWoQi
//
//  Created by myz on 15/9/21.
//  Copyright (c) 2015年 Savvy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HYRecordViewType)
{
    HYRecordViewTypeDay = 0,
    HYRecordViewTypeWeek,
    HYRecordViewTypeMonth,
};

@interface HYRecordView : UIView

@property (nonatomic, assign) HYRecordViewType viewType;

@property (nonatomic, strong) NSArray *dataArray;

//@property (nonatomic, assign) int monthLength;


@end
