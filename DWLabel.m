// DWLabel.m
//
// Copyright (c) 2012 Di Wu (http://diwublog.com)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write your own implementation of the copy: method." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

- (void) delete: (id) sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write your own implementation of the delete: method." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
