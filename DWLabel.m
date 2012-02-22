//
//  DWLabel.m
//  weixinlabel
//
//  Created by Di Wu on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DWLabel.h"

@interface DWLabel ()

- (void) attachGestureRecognizer;
- (void) handleGesture:(UIGestureRecognizer*) recognizer;

@end

@implementation DWLabel

#pragma mark - Override some original UILabel methods

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self attachGestureRecognizer];
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    [self attachGestureRecognizer];
}

- (BOOL) canPerformAction: (SEL) action withSender: (id) sender {

    if (action == @selector(copy:)) {
        return YES;
    } else if (action == @selector(delete:)) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) copy: (id) sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write your own implementation of the copy: method based on your needs." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

- (void) delete: (id) sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write your own implementation of the delete: method based on your needs." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

#pragma mark - Touch events handling

- (void) attachGestureRecognizer {
    [self setUserInteractionEnabled:YES];
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self addGestureRecognizer:recognizer];
    [recognizer release];
}

- (void) handleGesture: (UIGestureRecognizer*) recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }
    
}

@end
