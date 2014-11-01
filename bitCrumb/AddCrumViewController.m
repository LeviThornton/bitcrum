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
    
    NSLog(@"TextFieldShouldReturn: %@",textField);

    // remove keyboard, save any text and reset input field
    [self.crumTextField resignFirstResponder];
    self.crumTextField.text = nil;
    
    if(self.crumTextField.text.length>3) {
        NSLog(@"TextFieldShouldReturn insertCrum: %@", textField);
        [self insertCrum];
    }
    return YES;
}
- (void) insertCrum {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    Crum *entry = [NSEntityDescription insertNewObjectForEntityForName:@"BitCrum" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.crumText = (NSString *)self.crumTextField;
    [coreDataStack saveContext];
}

@end
