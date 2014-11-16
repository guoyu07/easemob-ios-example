/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "EMSearchBar.h"
#import "UIColor+CreateMethods.h"

@implementation EMSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [subView removeFromSuperview];
            }
            
            if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                UITextField *textField = (UITextField *)subView;
                [textField setBorderStyle:UITextBorderStyleNone];
                textField.background = nil;
                textField.frame = CGRectMake(8, 8, self.bounds.size.width - 2* 8,
                                             self.bounds.size.height - 2* 8);
                textField.layer.cornerRadius = 6;
                
                textField.clipsToBounds = YES;
                textField.backgroundColor = [UIColor whiteColor];
            }
        }
        
        self.barTintColor = [UIColor colorWithHex:@"#eeeeee" alpha:1];
        self.layer.borderColor = [[UIColor colorWithHex:@"#efefef" alpha:1] CGColor];
        self.layer.borderWidth = 1.0;
        
        // set Cancel text color
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                      [UIColor redColor],NSForegroundColorAttributeName,
                                                                                                      //[UIColor whiteColor],UITextAttributeTextShadowColor,
                                                                                                      //[NSValue valueWithUIOffset:UIOffsetMake(0, 1)],UITextAttributeTextShadowOffset,
                                                                                                      nil]
                                                                                            forState:UIControlStateNormal];
    }
    return self;
}

/**
 *  自定义控件自带的取消按钮的文字（默认为“取消”/“Cancel”）
 *
 *  @param title 自定义文字
 */
- (void)setCancelButtonTitle:(NSString *)title
{
    for (UIView *searchbuttons in self.subviews)
    {
        if ([searchbuttons isKindOfClass:[UIButton class]])
        {
            UIButton *cancelButton = (UIButton*)searchbuttons;
            [cancelButton setTitle:title forState:UIControlStateNormal];
            break;
        }
    }
}

@end
