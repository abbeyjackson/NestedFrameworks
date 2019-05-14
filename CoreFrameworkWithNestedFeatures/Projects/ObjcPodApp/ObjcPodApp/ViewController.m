//
//  ViewController.m
//  ObjcPodApp
//
//  Created by Abbey Jackson on 2019-05-02.
//  Copyright © 2019 abbeytest. All rights reserved.
//

#import "ViewController.h"
@import CoreFramework;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *coreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nestedSwiftLabel;
@property (weak, nonatomic) IBOutlet UILabel *nestedObjcLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *originalCoreLabel = self.coreLabel.text;
    [self.coreLabel setText:[[CFEntry new] coreLabel]];
    if (self.coreLabel.text != originalCoreLabel) {
        [self.coreLabel setBackgroundColor:[UIColor greenColor]];
    }

    // Always Embed Swift Standard Libraries must be set to YES
    NSString *originalNestedSwiftLabel = self.nestedSwiftLabel.text;
    [self.nestedSwiftLabel setText:[[CFEntry new] nestedSwiftLabel]];
    if (self.nestedSwiftLabel.text != originalNestedSwiftLabel) {
        [self.nestedSwiftLabel setBackgroundColor:[UIColor greenColor]];
    }

    NSString *originalNestedObjcLabel = self.nestedObjcLabel.text;
    [self.nestedObjcLabel setText:[[CFEntry new] nestedObjcLabel]];
    if (self.nestedObjcLabel.text != originalNestedObjcLabel) {
        [self.nestedObjcLabel setBackgroundColor:[UIColor greenColor]];
    }
}

@end
