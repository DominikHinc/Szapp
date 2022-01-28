//
//  HomeScreenViewController.m
//  Szapp
//
//  Created by Dominik Hinc on 27/01/2022.
//

#import <Foundation/Foundation.h>
#import "HomeScreenViewController.h"
#import "StackNavigationController.h"

@interface HomeScreenViewController ()

@end

NSArray<NSDictionary*> *array = @[@{@"title":@"iPhone 13", @"price": @1000, @"image":@"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=470&hei=556&fmt=png-alpha&.v=1631220221000"}, @{@"title":@"iPad Mini", @"price": @700, @"image":@"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-mini-select-wifi-starlight-202109_FMT_WHH?wid=1000&hei=1000&fmt=jpeg&qlt=95&.v=1629840333000"}, @{@"title":@"iMac Pro", @"price": @3400, @"image":@"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-2018-imac-pro-27-gallery?wid=1144&hei=1144&fmt=jpeg&qlt=80&.v=1589235413137"}, @{@"title":@"MacBook Pro", @"price": @1999, @"image":@"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp-spacegray-select-202011_GEO_EMEA_LANG_DE?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1632948907000"}];

@implementation HomeScreenViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.table.dataSource = self;
    self.table.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCellStyle"];
    
    UIView *content = [cell.contentView viewWithTag:1];
    UIImageView *productImage = [cell.contentView viewWithTag:4];
    
    UILabel *titleLabel = [content viewWithTag:0];
    UILabel *priceLabel = [content viewWithTag:2];
    
    NSDictionary *product =[array objectAtIndex:indexPath.row];
    
    titleLabel.text = (NSString*)product[@"title"];
    priceLabel.text = [@"$" stringByAppendingString: [(NSNumber*)product[@"price"] stringValue]];
    
    NSURL *imageURL = [NSURL URLWithString:product[@"image"]];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            productImage.image = [UIImage imageWithData:imageData];
        });
    });
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
