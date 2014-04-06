//
//  BENNotificationView.m
//  BENNotificationViewDemo
//
//  Created by Ben Packard on 4/5/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENNotificationView.h"

@implementation BENNotificationView

- (id)initWithAppName:(NSString *)appName notificationText:(NSString *)notificationText timeStampText:(NSString *)timeStampText appIconImage:(UIImage *)appIconImage
{
	self = [super initWithFrame:CGRectZero];
    if (self)
	{
		self.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1];
		
		UIImageView *appIcon = [[UIImageView alloc] initWithImage:appIconImage];
		appIcon.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:appIcon];
		
		UILabel *appNameLabel = [[UILabel alloc] init];
		appNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
		appNameLabel.text = appName;
		appNameLabel.font = [UIFont boldSystemFontOfSize:14];
		appNameLabel.textColor = [UIColor whiteColor];
		[self addSubview:appNameLabel];
		
		UILabel *timeLabel = [[UILabel alloc] init];
		timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
		timeLabel.text = timeStampText;
		timeLabel.font = [UIFont systemFontOfSize:11];
		timeLabel.textColor = [UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1];
		[self addSubview:timeLabel];
		
		//for the notification text, we have to slightly decrease the line height to match the original (note that a negative line spacing will not do anything)
		NSInteger fontSize = 14;
		NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
		[paragrahStyle setMaximumLineHeight:fontSize + 0.5];
		NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:notificationText attributes:@{NSParagraphStyleAttributeName:paragrahStyle}];
		UILabel *notificationLabel = [[UILabel alloc] init];
		notificationLabel.translatesAutoresizingMaskIntoConstraints = NO;
		notificationLabel.attributedText = attributedString;
		notificationLabel.font = [UIFont systemFontOfSize:fontSize];
		notificationLabel.textColor = [UIColor whiteColor];
		notificationLabel.numberOfLines = 2;
		notificationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
		[self addSubview:notificationLabel];
		
		UIImageView *lozenge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lozenge"]];
		lozenge.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:lozenge];
		
		NSDictionary *views = NSDictionaryOfVariableBindings(appIcon, appNameLabel, notificationLabel, lozenge, timeLabel);
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-15-[appIcon(==20)]-11-[notificationLabel]-15-|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[appNameLabel]-9-[timeLabel]" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-7.5-[appIcon]" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[appNameLabel]-(1)-[notificationLabel]-3-[lozenge]-3-|" options:0 metrics:nil views:views]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:appIcon
														 attribute:NSLayoutAttributeHeight
														 relatedBy:NSLayoutRelationEqual
															toItem:appIcon
														 attribute:NSLayoutAttributeWidth
														multiplier:1
														  constant:0]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:appNameLabel
														 attribute:NSLayoutAttributeTop
														 relatedBy:NSLayoutRelationEqual
															toItem:appIcon
														 attribute:NSLayoutAttributeTop
														multiplier:1
														  constant:-2]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:timeLabel
														 attribute:NSLayoutAttributeCenterY
														 relatedBy:NSLayoutRelationEqual
															toItem:appNameLabel
														 attribute:NSLayoutAttributeCenterY
														multiplier:1
														  constant:0]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:notificationLabel
														 attribute:NSLayoutAttributeLeft
														 relatedBy:NSLayoutRelationEqual
															toItem:appNameLabel
														 attribute:NSLayoutAttributeLeft
														multiplier:1
														  constant:0]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:lozenge
														 attribute:NSLayoutAttributeCenterX
														 relatedBy:NSLayoutRelationEqual
															toItem:self
														 attribute:NSLayoutAttributeCenterX
														multiplier:1
														  constant:0]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithAppName:@"App Name" notificationText:@"Notification Text." timeStampText:@"now" appIconImage:nil];
}

@end
