//
//  AddCrumViewController.m
//  bitCrumb
//
//  Created by Levi Thornton on 10/25/14.
//  Copyright (c) 2014 Hucked Media. All rights reserved.
//

#import "AddCrumViewController.h"
#import "CoreDataStack.h"
#import "Crum.h"

@interface AddCrumViewController ()

@end

@implementation AddCrumViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.crumTextField.delegate = self;
    [self.crumTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    // remove keyboard, save any text and reset input field
    [self.crumTextField resignFirstResponder];

    if(self.crumTextField.text.length>0) {
        [self insertCrum];
        self.crumTextField.text = nil;
    }
    return YES;
}
- (void) insertCrum {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    Crum *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.text = self.crumTextField.text;
    //entry.date
    [coreDataStack saveContext];
}

@end
