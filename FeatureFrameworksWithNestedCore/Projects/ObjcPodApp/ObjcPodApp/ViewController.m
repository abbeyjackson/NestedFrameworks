//
//  ViewController.m
//  ObjcPodApp
//
//  Created by Abbey Jackson on 2019-05-02.
//  Copyright © 2019 abbeytest. All rights reserved.
//

#import "ViewController.h"
@import SwiftFeatureFramework;
@import ObjcFeatureFramework;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *swiftLabel;
@property (weak, nonatomic) IBOutlet UILabel *objcLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Always Embed Swift Standard Libraries must be set to YES
    NSString *originalSwiftLabel = self.swiftLabel.text;
    [self.swiftLabel setText:[[SFFEntry new] swiftLabel]];
    if (self.swiftLabel.text != originalSwiftLabel) {
        [self.swiftLabel setBackgroundColor:[UIColor greenColor]];
    }

    NSString *originalObjcLabel = self.objcLabel.text;
    [self.objcLabel setText:[[OFFEntry new] objcLabel]];
    if (self.objcLabel.text != originalObjcLabel) {
        [self.objcLabel setBackgroundColor:[UIColor greenColor]];
    }
}


@end
