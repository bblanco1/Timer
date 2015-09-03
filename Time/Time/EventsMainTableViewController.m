//
//  TimerMainTableViewController.m
//  Time
//
//  Created by Brian Blanco on 8/28/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "EventsMainTableViewController.h"
#import "PresetEvents.h"
#import "Events.h"
#import "EventsDetailViewController.h"



@interface EventsMainTableViewController ()

@property (nonatomic) PresetEvents *model;

@end

@implementation EventsMainTableViewController

-(void)awakeFromNib {
    
    UITabBarItem *events = [[UITabBarItem alloc]initWithTitle:@"Events" image:[UIImage imageNamed:@"calendarEDIT"] selectedImage:[UIImage imageNamed:@"calendarEDIT"]];
    
    [self setTabBarItem:events];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [PresetEvents sharedInstance];
    
    [self.model initializeEvents];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.destinationViewController isKindOfClass:[EventsDetailViewController class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Events *event = [self.model.allEvents objectAtIndex:indexPath.row];
        NSString *eventName = event.eventName;
        NSString *eventCountDown = event.timeDisplay;
        
        EventsDetailViewController *destination = segue.destinationViewController;
        destination.eventName = eventName;
        destination.eventCountDown = eventCountDown;
        
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return [self.model.allEvents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCountDown" forIndexPath:indexPath];
    
    Events *event = [self.model.allEvents objectAtIndex:indexPath.row];
    
    NSString *eventName = [event eventName];
    
    cell.textLabel.text = eventName;
    
    return cell;
}




@end
