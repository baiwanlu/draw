//
//  Define.h
//  qida
//
//  Created by myz on 15/7/15.
//  Copyright (c) 2015年 Savvy. All rights reserved.
//

#ifndef qida_Define_h
#define qida_Define_h


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kOrangeColor RGBColor(255, 150, 0, 1)
#define kBrownColor  RGBColor(98, 48, 50, 1)
#define kGreenColor  RGBColor(102, 255, 242, 1)
//(101, 83, 71, 1)

#define iPhone5   (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define centerX (kWidth * 0.5)
#define ratioOfHeight (kHeight / 667.0)

//-------------------------NSNotification--------------------------
#define kSuggestionSearchNot        @"SuggestionSearchNot"

#define WEAKSELF typeof(self) __weak weakSelf = self
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf

// -----------------------NSUserDefaults--------------------------
#define kUserGender     @"userGender"
#define kUserHeight     @"userHeight"
#define kUserWeight     @"userWeight"

#define kUserTargetFlag @"userTargetFlag"
#define kUserTarget     @"userTarget"
#define kHighSpeed      @"highSpeed"
#define kSecondSpeed    @"secondSpeed"


#ifdef DEBUG
#   define DEBUG_METHOD(...) NSLog(__VA_ARGS__)
#   define NSLog(format, ...) NSLog(format, ##__VA_ARGS__);
#else
#   define DEBUG_METHOD(...)
#   define NSLog(format, ...)
#endif

#endif
