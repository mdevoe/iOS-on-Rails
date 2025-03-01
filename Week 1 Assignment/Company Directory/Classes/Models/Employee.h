//
//  Employee.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

// @todo Add properties for name, job title, birthday, and salary
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSDate   *birthday;
@property (nonatomic, retain) NSNumber *salary;

// @todo Implement the following methods

- (id)initWithName:(NSString *)name;
- (id)initWithNameTitleBirthSalary:(NSString *)name
                                  :(NSString *)title
                                  :(NSDate *)birthday
                                  :(NSNumber *)salary;

+ (NSArray *)sampleListOfEmployees;

@end
