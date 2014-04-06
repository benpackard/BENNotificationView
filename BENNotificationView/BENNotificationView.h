//
//  BENNotificationView.h
//  BENNotificationViewDemo
//
//  Created by Ben Packard on 4/5/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BENNotificationView : UIView

- (id)initWithAppName:(NSString *)appName notificationText:(NSString *)notificationText timeStampText:(NSString *)timeStampText appIconImage:(UIImage *)appIconImage;

@end
