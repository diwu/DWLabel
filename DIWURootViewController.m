//
//  DIWURootViewController.m
//  weixinlabel
//
//  Created by Di Wu on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIWURootViewController.h"
#import "DWLabel.h"

@interface DIWURootViewController ()

@property (nonatomic, retain) UIImage *chatBubbleImage;
@property (nonatomic, retain) UIImageView *firstImageView;
@property (nonatomic, retain) UIImageView *secondImageView;
@property (nonatomic, retain) UILabel *regularLabel;
@property (nonatomic, retain) DWLabel *dwLabel;

@end

@implementation DIWURootViewController

@synthesize chatBubbleImage;
@synthesize firstImageView;
@synthesize secondImageView;
@synthesize regularLabel;
@synthesize dwLabel;

- (void)dealloc {

    [dwLabel release];
    [regularLabel release];
    [secondImageView release];
    [firstImageView release];
    [chatBubbleImage release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
    CGRect navFrame = [[UIScreen mainScreen] applicationFrame];
    navFrame.size.height -= self.navigationController.navigationBar.frame.size.height;
    
    UIView *tmpView = [[UIView alloc] initWithFrame:navFrame];
    self.view = tmpView;
    [tmpView release];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.chatBubbleImage = [[UIImage imageNamed:@"weixin"] resizableImageWithCapInsets:UIEdgeInsetsMake(27, 29, 26, 28)];
    
    UIImageView *tmpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 155, 54)];
    tmpImageView.userInteractionEnabled = YES;
    self.firstImageView = tmpImageView;
    [tmpImageView release];
    self.firstImageView.image = self.chatBubbleImage;
    UILabel *tmpRegularLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 155, 54)];
    self.regularLabel = tmpRegularLabel;
    [tmpRegularLabel release];
    self.regularLabel.backgroundColor = [UIColor clearColor];
    self.regularLabel.text = @"regular UILabel";
    self.regularLabel.font = [UIFont systemFontOfSize:18];
    [self.firstImageView addSubview:self.regularLabel];
    [self.view addSubview:self.firstImageView];
    
    tmpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 180, 54)];
    tmpImageView.userInteractionEnabled = YES;
    self.secondImageView = tmpImageView;
    [tmpImageView release];
    self.secondImageView.image = self.chatBubbleImage;
    DWLabel *tmpDWLabel = [[DWLabel alloc] initWithFrame:CGRectMake(18, 0, 180, 54)];
    self.dwLabel = tmpDWLabel;
    [tmpDWLabel release];
    self.dwLabel.backgroundColor = [UIColor clearColor];
    self.dwLabel.text = @"tappable DWLabel";
    self.dwLabel.font = [UIFont systemFontOfSize:18];
    [self.secondImageView addSubview:self.dwLabel];
    [self.view addSubview:self.secondImageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
