//
//  TWMessageTableViewCell.m
//  Messages
//
//  Created by Sam Soffes on 3/10/10.
//  Copyright 2010 Tasteful Works. All rights reserved.
//

#import "TWMessageTableViewCell.h"
#import "TWMessageTableViewCellBubbleView.h"

@implementation TWMessageTableViewCell

#pragma mark NSObject

- (void)dealloc {
	[bubbleView release];
	[super dealloc];
}

#pragma mark UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;		
		self.textLabel.hidden = YES;
				
		bubbleView = [[TWMessageTableViewCellBubbleView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
		bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self.contentView addSubview:bubbleView];
		[self.contentView sendSubviewToBack:bubbleView];
    }
    return self;
}

#pragma mark Getters

- (TWMessageTableViewCellMessageStyle)messageStyle {
	return bubbleView.messageStyle;
}


- (NSString *)messageText {
	return bubbleView.messageText;
}

#pragma mark Setters

- (void)setMessageStyle:(TWMessageTableViewCellMessageStyle)aMessageStyle {
	bubbleView.messageStyle = aMessageStyle;
}


- (void)setMessageText:(NSString *)text {
	bubbleView.messageText = text;
}

@end
