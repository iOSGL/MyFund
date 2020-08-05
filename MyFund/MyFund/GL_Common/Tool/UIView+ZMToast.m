//
//  UIView+ZMToast.m
//  Pods
//
//  Created by ZM on 2020/2/26.
//

#import "UIView+ZMToast.h"
#import "Toast.h"
#import <YYCategories/YYCategories.h>

@implementation UIView (ZMToast)

- (void)gl_showToast:(NSString *)message {
    [self hideToast];
    if (message.length==0) {
        return;
    }
    CSToastStyle * style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = UIColorHex(333333);
    style.cornerRadius = 20;
    style.horizontalPadding = 28;
    style.titleFont = [UIFont systemFontOfSize:12];

    [self makeToast:message duration:3 position:CSToastPositionCenter style:style];
}

- (void)gl_showToast:(NSString *)message duration:(NSTimeInterval)duration {
    if (message.length==0) {
        return;
    }
    CSToastStyle * style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = UIColorHex(333333);
    style.cornerRadius = 20;
    style.horizontalPadding = 28;
    style.titleFont = [UIFont systemFontOfSize:12];

    [self makeToast:message duration:duration position:CSToastPositionCenter style:style];
}

- (void)gl_showToast:(NSString *)message position:(id)position {
    if (message.length==0) {
        return;
    }
    CSToastStyle * style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = UIColorHex(333333);
    style.cornerRadius = 15;
    style.titleFont = [UIFont systemFontOfSize:12];
    [self makeToast:message duration:3 position:position style:style];
}


- (void)gl_hideToast {
    [self hideAllToasts];
}

@end
