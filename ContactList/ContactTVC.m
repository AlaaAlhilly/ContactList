//
//  ContactTVC.m
//  ContactList
//
//  Created by Alaa_Naji on 6/9/16.
//  Copyright © 2016 Alaa_Naji. All rights reserved.
//

#import "ContactTVC.h"
#import "AddContactVC.h"
@interface ContactTVC () <AddContactVCDelegat>
@property (nonatomic,strong) NSMutableArray* names;
@property (nonatomic,strong) NSMutableArray* phones;
@end

@implementation ContactTVC
-(NSMutableArray*) phones{
    if (_phones==nil)
    {
        _phones=[[NSMutableArray alloc]init];
    }
    return _phones;
}
-(NSMutableArray*) names
{
    if(_names==nil)
    {
        _names=[[NSMutableArray alloc]init];
    }
    return _names;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.names=[NSMutableArray arrayWithObjects:@"Alaa",@"Ahmed",@"Mohamed",@"Kadhim",@"Satar",@"Sura",@"Husen"
                ,@"Esraa",@"Tabarak",@"Ameer",@"Yahya",@"Jabar",@"Arkan",@"Falih",@"Zuha", nil];
    self.phones=[NSMutableArray arrayWithObjects:@"0780-192-5678",@"0781-1985-083",@"0780-220-0313",@"0781-198-5082"
                ,@"0781-147-2340",@"0782-564-2983",@"0772-233-2222",@"0751-234-2340",@"0780-675-9876"
                ,@"0781-111-1110",@"0782-657-2349",@"0771-659-9880",@"0772-123-4567",@"0781-872-3219"
                ,@"0771-876-2390", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc ]init];
    }
    // Configure the cell...
    cell.textLabel.text=[self.names objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.phones objectAtIndex:indexPath.row];
    return cell;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddContact"]){
        [(AddContactVC*)segue.destinationViewController setDelegate:self];
    }
}
-(void) dismissAddContactVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) addContactName:(NSString*) name withPhone:(NSString*) phone
{
    [self.names addObject:name];
    [self.phones addObject:phone];
    [self.tableView reloadData];
    [self dismissAddContactVC];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
