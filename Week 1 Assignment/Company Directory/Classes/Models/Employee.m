//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "Employee.h"

static NSDate * BirthdayWithMonthDayYear(NSUInteger month, NSUInteger day, NSUInteger year) {
  NSCalendar *gregorianCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
  
  NSDateComponents *birthdayComponents = [[[NSDateComponents alloc] init] autorelease];
  [birthdayComponents setMonth:month];
  [birthdayComponents setDay:day];
  [birthdayComponents setYear:year];
  
  return [gregorianCalendar dateFromComponents:birthdayComponents];
}


@implementation Employee

// @todo Synthesize properties in interface
@synthesize name;
@synthesize title;
@synthesize birthday;
@synthesize salary;


- (id)initWithName:(NSString *)name {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setName:name];
  return self;
}

- (id)initWithNameTitleBirthSalary:(NSString *)name
                                  :(NSString *)title
                                  :(NSDate *)birthday
                                  :(NSNumber *)salary{
  if(self=[super init]){
    [self setName:name];
    [self setTitle:title];
    [self setBirthday:birthday];
    [self setSalary:salary];
    return self;
  }
  return nil;
}

- (void)dealloc {
    // @todo Release instance variables from properties
  [name release];
  [title release];
  [birthday release];
  [salary release];
  [super dealloc];
}

+ (NSArray *)sampleListOfEmployees {
    // @todo Create a list of a couple employees with made-up data
  NSMutableArray *list = [[NSMutableArray alloc] init];
  [list addObject:
   [[Employee alloc]initWithNameTitleBirthSalary:@"Matt DeVoe" 
                                                :@"Hardware Engineer" 
                                                :BirthdayWithMonthDayYear(8, 9, 1985) 
                                                :[NSNumber numberWithInt:100000]]];
  [list addObject:
   [[Employee alloc]initWithNameTitleBirthSalary:@"Conan" 
                                                :@"Barbarian" 
                                                :BirthdayWithMonthDayYear(4, 1, 1384) 
                                                :[NSNumber numberWithInt:123456]]];
  [list addObject:
   [[Employee alloc]initWithNameTitleBirthSalary:@"Thomas Pynchon" 
                                                :@"Writer" 
                                                :BirthdayWithMonthDayYear(5, 8, 1937) 
                                                :[NSNumber numberWithInt:250000]]];
  return [NSArray arrayWithArray:list];
}

@end
