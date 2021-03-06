//
//  MealTableViewController.m
//  Study
//
//  Created by LvZheng on 16/8/3.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "MealTableViewController.h"
#import "Meal.h"
#import "MealTableViewCell.h"
#import "MealViewController.h"
#import "MealTableViewCell.h"

@interface MealTableViewController ()

@property(nonatomic) NSMutableArray *meals;

@end

@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init the date of table view
    
//    NSMutableArray * meals = [self loadMeals];
    
//    if(meals){
//
//        _meals = meals;
//
//    }else{
        [self loadSimpleMeal];
//    }
    
    
    self.navigationItem.leftBarButtonItem = [self editButtonItem];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadSimpleMeal{
    self.meals = [NSMutableArray new];
    
    UIImage *photo1 = [UIImage imageNamed:@"meal1"];
    Meal *meal1 =  [[Meal alloc] initWithName:@"Meal1" rating:3
                                        photo:photo1];
    [_meals addObject:meal1];
    
    UIImage *photo2 = [UIImage imageNamed:@"meal2"];
    Meal *meal2 = [[Meal alloc] initWithName:@"Meal2" rating:2 photo:photo2];
    [_meals addObject:meal2];
    
    UIImage *photo3 = [UIImage imageNamed:@"meal3"];
    Meal *meal3 = [[Meal alloc] initWithName:@"Meal3" rating:5 photo:photo3];
    [_meals addObject:meal3];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_meals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MealTableViewCell" forIndexPath:indexPath];
    
    
    Meal *meal = _meals[indexPath.row];
    
    cell.name.text = meal.name;
    
    cell.photo.image = meal.photo;
    
    cell.rating.rating = meal.rating;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_meals removeObjectAtIndex:indexPath.row];
        
        [self saveMeals];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"showDetail"]){
        
        MealViewController *mealViewController = [segue destinationViewController];
        
        MealTableViewCell *tableViewCell = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tableViewCell];
        
        Meal *selectMeal = [_meals objectAtIndex:indexPath.row];
        
        mealViewController.meal = selectMeal;
        
    }else if([segue.identifier isEqualToString:@"addItem"]){
        
    };
}

- (IBAction)unwindToMealList:(UIStoryboardSegue *)unwindSegue {
    NSLog(@"I am segue from save");
    
    MealViewController *mealViewController = unwindSegue.sourceViewController;
    
    Meal *meal = mealViewController.meal;
    
    // add new meal to table view
    
    if(mealViewController && meal){
        NSIndexPath *selectIndexPath = [self.tableView indexPathForSelectedRow];
        
        if(selectIndexPath){
            // Update an old Meal
            
            _meals[selectIndexPath.row] = meal;
            
            [self.tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            
            
        }else{
            // Add a new Meal
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_meals.count inSection:0];
            
            [_meals addObject:meal];
            
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
            
        }
        
        [self saveMeals];
        
        
    }else{
        NSLog(@"happened a error");
    }
    
    
    
}

#pragma mark - NSCoding

- (void)saveMeals{
    
    NSString *path = [Meal archivePath];
    
//    NSMutableData *data = [[NSMutableData alloc] init];
//    
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    
//    [archiver encodeObject:@"" forKey:@"key_meals"];
//    
//    [archiver finishEncoding];
//    
//    Boolean isSuccessful = [data writeToFile:path atomically:YES];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:_meals forKey:@"keymeals"];
    
    Boolean isSuccessful = [NSKeyedArchiver archiveRootObject:@"nihao" toFile:path];
    
    if(!isSuccessful){
        NSLog(TAG"Failed to save meals!%@",path);
    }
    
}

-(NSMutableArray *)loadMeals{
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[Meal archivePath]];
    
}


@end
