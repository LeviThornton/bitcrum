//
//  CrumViewController.m
//  bitCrumb
//
//  Created by Levi Thornton on 10/14/14.
//  Copyright (c) 2014 Hucked Media. All rights reserved.
//

#import "CrumViewController.h"
#import "AddCrumViewController.h"

@interface CrumViewController ()

@end

@implementation CrumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // open our CV segues
    [self.container.viewControllers[0]  performSegueWithIdentifier:@"addCrumCV" sender: nil];
    [self.container.viewControllers[1]  performSegueWithIdentifier:@"crumTableCV" sender: nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@",sender);
    
    NSString * segueName = segue.identifier;
    
    if ([segueName isEqualToString: @"addCrumCV"]) {
        /// nothing yet
    } else if([segueName isEqualToString: @"crumTableCV"]) {
        /// nothing yet
    }
}
@end
