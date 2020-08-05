//
//  UIView+ZMToast.h
//  Pods
//
//  Created by ZM on 2020/2/26.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZMToast)

- (void)gl_showToast:(NSString *)message;

- (void)gl_showToast:(NSString *)message duration:(NSTimeInterval)duration;

- (void)gl_showToast:(NSString *)message position:(id)position;

- (void)gl_hideToast;

@end

NS_ASSUME_NONNULL_END
