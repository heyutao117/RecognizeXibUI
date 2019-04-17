//
//  ViewController.m
//  RecognizeXibUI
//
//  Created by xyt on 2019/4/17.
//  Copyright © 2019年 xyt. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerManager.h"
#import "SegmentManager.h"
#import "SegmentView.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet ViewControllerManager *Manager;
@property (nonatomic,strong )  SegmentManager *segmentManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentManager = [SegmentManager new];
    
    NSDictionary *optionDict1 =@{UINibExternalObjects:@{@"SegmentManager":self.segmentManager}} ;
    SegmentView *segView = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([SegmentView class]) owner:self options:optionDict1].firstObject;
    segView.center = self.view.center;
    [self.view addSubview:segView];
    
    NSDictionary *optionDict2 = @{UINibExternalObjects:@{@"SegmentViewXibManager":self.Manager}};
    UIView *xibView = [[NSBundle mainBundle]loadNibNamed:@"SegmentViewXIB" owner:self options:optionDict2].lastObject;
    [self.view addSubview:xibView];
    
    xibView.frame = CGRectMake(0, CGRectGetMaxY(segView.frame)+10, xibView.frame.size.width, xibView.frame.size.height);
    
    
}




@end
