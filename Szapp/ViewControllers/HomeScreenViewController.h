//
//  HomeScreenViewController.h
//  Szapp
//
//  Created by Dominik Hinc on 27/01/2022.
//

#ifndef HomeScreenViewController_h
#define HomeScreenViewController_h

#import <UIKit/UIKit.h>

@interface HomeScreenViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *table;

@end


#endif /* HomeScreenViewController_h */
