//
//  FirstViewController.h
//  InterfaceTransferValue
//
//  Created by MAC on 2018/10/29.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PushToContentDelegate <NSObject>
- (void)pushToConttent:(id)content;
@end
@interface FirstViewController : UIViewController
@property (nonatomic, copy) NSString * stringData;
@property (nonatomic, strong) NSArray * array;
@property (nonatomic, strong) NSDictionary * dict;
@property (nonatomic, copy) void(^ myBlock) (NSString *);
@property (nonatomic, assign) id<PushToContentDelegate> delegate;

@end

