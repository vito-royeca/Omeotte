//
//  ORules.m
//  Omeotte
//
//  Created by Jovito Royeca on 8/20/13.
//  Copyright (c) 2013 JJJ Software. All rights reserved.
//

#import "ORule.h"

@implementation ORule

@synthesize name;
@synthesize location;
@synthesize base;
@synthesize cardsInHand;
@synthesize winningTower;
@synthesize winningResource;
@synthesize price;

+(NSArray*)allRules
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rules" ofType:@"plist"];
    NSMutableArray *mArr = [NSMutableArray arrayWithContentsOfFile:filePath];
    NSMutableArray *arrRules = [[NSMutableArray alloc] initWithCapacity:[mArr count]];
        
    for (NSDictionary *dict in mArr)
    {
        ORule *rule = [[ORule alloc] init];
            
        rule.name = [dict valueForKey:@"name"];
        rule.location = [dict valueForKey:@"location"];
            
        OStats *base = [[OStats alloc] init];
        base.tower = [[dict valueForKey:@"tower"] intValue];
        base.wall = [[dict valueForKey:@"wall"] intValue];
        base.bricks = [[dict valueForKey:@"bricks"] intValue];
        base.gems = [[dict valueForKey:@"gems"] intValue];
        base.recruits = [[dict valueForKey:@"recruits"] intValue];
        base.quarries = [[dict valueForKey:@"quarries"] intValue];
        base.magics = [[dict valueForKey:@"magics"] intValue];
        base.dungeons = [[dict valueForKey:@"dungeons"] intValue];
        rule.base = base;

        rule.cardsInHand = [[dict valueForKey:@"cardsInHand"] intValue];
        rule.winningTower = [[dict valueForKey:@"winningTower"] intValue];
        rule.winningResource = [[dict valueForKey:@"winningResource"] intValue];
        rule.price = [[dict valueForKey:@"price"] intValue];

        [arrRules addObject:rule];
    }

    return arrRules;
}

@end
