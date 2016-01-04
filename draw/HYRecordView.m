//
//  HYRecordView.m
//  AiWoQi
//
//  Created by myz on 15/9/21.
//  Copyright (c) 2015年 Savvy. All rights reserved.
//

#import "HYRecordView.h"

#import "Define.h"


#define gap 10
#define fontSize 8.0

#define kColor1 [UIColor brownColor]
#define kColor2 [UIColor greenColor]

@interface HYRecordView ()

@property (nonatomic, assign) int XAxisNum;
@property (nonatomic, assign) int YAxisNum;
@property (nonatomic, assign) int YAxisScale;

@property (nonatomic, strong) NSArray *weekArray;
@end

@implementation HYRecordView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initialization];
        
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialization];
    }
    return self;
}
- (void)initialization
{
    self.backgroundColor = [UIColor clearColor];
    _XAxisNum = 24;
}


- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self setNeedsDisplay];
}

- (void)setViewType:(HYRecordViewType)viewType
{
    _viewType = viewType;
    switch (viewType) {
        case HYRecordViewTypeDay:
        {
            _XAxisNum = 24;
            _YAxisNum = 5;
            _YAxisScale = 20;
        } break;
            
        case HYRecordViewTypeWeek:
        {
            _XAxisNum = 7;
            _YAxisNum = 5;
            _YAxisScale = 40;
        } break;
            
        case HYRecordViewTypeMonth:
        {
            if (_dataArray) {
                _XAxisNum = (int)_dataArray.count;
            }
            _YAxisNum = 5;
            _YAxisScale = 100;
        } break;
            
        default:
            break;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@" %@  %ld  %d  %d", _dataArray, _dataArray.count, _XAxisNum, _YAxisNum);
    //CGFloat marginX = rect.size.width * 0.1;
    //CGFloat marginY = rect.size.height * 0.1;
    CGFloat width = rect.size.width * 0.8;
    CGFloat height = rect.size.height * 0.8;
    CGFloat x0 = rect.size.width * 0.1 + 6;
    CGFloat y0 = rect.size.width * 0.9 - 6;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    
    [[UIColor brownColor] setFill];
    // x 轴
    CGContextMoveToPoint(context, x0, y0);
    CGContextAddLineToPoint(context, x0 + width + gap, y0);
    CGContextStrokePath(context);

    // 刻度标注
    if (_viewType == HYRecordViewTypeMonth) {
        _XAxisNum = (int)_dataArray.count;
    }
    for (int index = 1; index <= _XAxisNum; index++) {
        CGFloat space = height / (float)_XAxisNum;
        CGContextMoveToPoint(context, x0 + space * index, y0);
        CGContextAddLineToPoint(context, x0 + space * index, y0 + 4);
        CGContextStrokePath(context);
        
        if (_viewType == HYRecordViewTypeWeek) {
            NSString *title = _weekArray[index - 1];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.alignment = NSTextAlignmentCenter;
            NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName:kBrownColor};
            [title drawInRect:CGRectMake(x0 + space * (index - 1), y0 + 4, space, 10) withAttributes:attributes];
        } else {
            if (index % 2 == 0) {
                NSString *title = [NSString stringWithFormat:@"%d", index];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.alignment = NSTextAlignmentCenter;
                NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName:kBrownColor};
                [title drawInRect:CGRectMake(x0 + space * index - 10, y0 + 4, 20, 10) withAttributes:attributes];
            }
        }
        
        
        //  柱图
        CGFloat altitude = 0;
        if (self.dataArray.count) {
            altitude = [self.dataArray[index - 1] intValue] * height / (_YAxisScale * _YAxisNum);
//            NSLog(@" altitude %f", altitude);
            
            if (index % 2 == 0) {
                [kColor1 setFill];
            } else {
                [kColor2 setFill];
            }
            CGContextAddRect(context, CGRectMake(x0 + space * (index - 1), y0, space, -altitude));
            CGContextFillPath(context);
        }
        
    }

//    
//    [[UIColor brownColor] setFill];
//    // y 轴
//    CGContextMoveToPoint(context, x0, y0);
//    CGContextAddLineToPoint(context, x0, y0 - gap - height);
//    CGContextStrokePath(context);
//    //  箭头
//    CGContextMoveToPoint(context, x0 - 2, y0 - gap - height);
//    CGContextAddLineToPoint(context, x0 + 2, y0 - gap - height);
//    CGContextAddLineToPoint(context, x0, y0 - gap - height - 10);
//    CGContextClosePath(context);
//    CGContextFillPath(context);
//    [@"(m)" drawAtPoint:CGPointMake(x0 - 20, y0 - height - gap - 12) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
//    
//    
//    // 刻度标注
//    for (int index = 1; index <= _YAxisNum; index++) {
//        CGFloat space = height / (float)_YAxisNum;
//        CGContextMoveToPoint(context, x0, y0 - space * index);
//        CGContextAddLineToPoint(context, x0 - 4, y0 - space * index);
//        CGContextStrokePath(context);
//        //NSLog(@" %f", space);
//        
//        NSString *title = [NSString stringWithFormat:@"%d", index * _YAxisScale];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.alignment = NSTextAlignmentRight;
//        NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName:kBrownColor};
//        [title drawInRect:CGRectMake(x0 - 24, y0 - space * index - 5, 20, 10) withAttributes:attributes];
//        
//    }

    
    
}


@end
