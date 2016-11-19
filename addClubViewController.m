//
//  addClubViewController.m
//  clubManager
//
//  Created by 刘人华 on 2016/10/19.
//  Copyright © 2016年 刘人华. All rights reserved.
//

#import "addClubViewController.h"

@interface addClubViewController ()

@property (strong,nonatomic)NSString * clubName;
@property (strong,nonatomic)NSString * clubSize;
@property (strong,nonatomic)NSMutableDictionary * data;
//@property (retain, nonatomic) IBOutlet UITextField *clubName;
//@property (retain, nonatomic) IBOutlet UITextField *clubSize;

@end

@implementation addClubViewController

@synthesize clubName;
@synthesize clubSize;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
}

- (NSString*)dataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    NSString *fileName = [documentPath stringByAppendingPathComponent:@"data.plist"];
    return fileName;
}

- (IBAction)textField:(id)sender {
    UITextField *textfield = (UITextField *)sender;
    if (textfield.tag == 0) {
        self.clubName = textfield.text;
    } else {
        self.clubSize = textfield.text;
    }
}

- (IBAction)saveButton:(id)sender {
    // add info of the new club to a dictionary
    NSMutableDictionary *newDict = [NSMutableDictionary dictionaryWithCapacity:3];
    [newDict setObject:self.clubName forKey:@"Name"];
    [newDict setObject:self.clubSize forKey:@"Size"];
    NSLog(@"%@", newDict);
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSString *pathStr = [self dataFilePath];
    NSLog(@"pathStr: %@", pathStr);
    NSMutableDictionary *plistData = [[NSMutableDictionary alloc] initWithContentsOfFile:pathStr];
    [data addEntriesFromDictionary:plistData];
    [data setObject:newDict forKey:self.clubName];
    
    NSLog(@"%@", data);
    [data writeToFile:pathStr atomically:YES];
    
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)inputName:(id)sender {
}

- (IBAction)inputSize:(id)sender {
}
@end
