//
//  ViewController.m
//  ObjCPracetice
//
//  Created by Dinh Thanh An on 4/6/17.
//  Copyright © 2017 Dinh Thanh An. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self solution];
}
// ---------------------------



// ---------------------------

NSMutableArray * solutionFindCoordinatesIntersection(NSInteger x, NSInteger y, NSInteger x2, NSInteger y2, NSInteger x3, NSInteger y3, NSInteger x4, NSInteger y4){
    NSMutableArray *result = [NSMutableArray new];
    
    CGRect rect = CGRectMake(x, y, labs(x2 - x), labs(y2 - y));
    CGRect rect2 = CGRectMake(x3, y3, labs(x4 - x3), labs(y4 - y3));
    
    NSMutableArray *listPositionIntersection = [[NSMutableArray alloc] initWithArray:@[@[@(x),@(y3)], @[@(x),@(y4)], @[@(x2),@(y3)], @[@(x2),@(y4)], @[@(x3),@(y)], @[@(x3),@(y2)], @[@(x4),@(y)], @[@(x4),@(y2)]] ];
    
    if (CGRectIntersectsRect(rect, rect2)) {
        CGRect rectResult = CGRectIntersection(rect, rect2);
        
        CGPoint intersection = rectResult.origin;
        CGPoint intersection2 = CGPointMake(rectResult.origin.x + rectResult.size.width, rectResult.origin.y);
        CGPoint intersection3 = CGPointMake(rectResult.origin.x + rectResult.size.width, rectResult.origin.y + rectResult.size.height);
        CGPoint intersection4 = CGPointMake(rectResult.origin.x, rectResult.origin.y + rectResult.size.height);
        
        [result addObject:@[@(intersection.x),@(intersection.y)]];
        [result addObject:@[@(intersection2.x),@(intersection2.y)]];
        [result addObject:@[@(intersection3.x),@(intersection3.y)]];
        [result addObject:@[@(intersection4.x),@(intersection4.y)]];
        
        for (int i = 3; i >= 0; i--) {
            BOOL isIntersect = NO;
            CGPoint intersectPoint = CGPointMake([result[i][0] integerValue], [result[i][1] integerValue]);
            for (int j = 0; j < listPositionIntersection.count; j++) {
                CGPoint intersectPoint2 = CGPointMake([listPositionIntersection[j][0] integerValue], [listPositionIntersection[j][1] integerValue]);
                if (intersectPoint.x == intersectPoint2.x && intersectPoint.y == intersectPoint2.y) {
                    isIntersect = YES;
                    break;
                }
            }
            if (!isIntersect) {
                [result removeObjectAtIndex:i];
            }
        }
    }
    
    NSLog(@"solutionFindCoordinatesIntersection: %@", result);
    
    return result;
}

// ---------------------------

NSString * solutionBitwiseXorAllNumberBetween(NSInteger min, NSInteger max){
    NSInteger result = min;
    
    for (NSInteger i = min + 1; i <= max; i++) {
        result = result ^ i;
    }
    
    NSMutableString *str = [NSMutableString stringWithFormat:@""];
    for(NSInteger numberCopy = result; numberCopy > 0; numberCopy >>= 1) {
        [str insertString:((numberCopy & 1) ? @"1" : @"0") atIndex:0];
    }
    
    NSLog(@"solutionBitwiseXorAllNumberBetween %@", str);
    
    return str;
}

// ---------------------------

NSMutableArray * solutionFindString(NSString *A) {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:@[A]];
    
    if (A.length <= 1) {
        return result;
    }
    
    recursionToFindStringWithPreviousResult(result, A);
    
    NSLog(@"result: %@", result);
    
    return result;
}

void recursionToFindStringWithPreviousResult(NSMutableArray *previousResult, NSString *previousString){
    for (NSInteger i = 0; i < previousString.length - 1; i++) {
        for (NSInteger j = i + 1; j < previousString.length; j++) {
            NSString *stringAtI = [previousString substringWithRange:NSMakeRange(i, 1)];
            NSString *stringAtJ = [previousString substringWithRange:NSMakeRange(j, 1)];
            
            if ([stringAtI isEqualToString:stringAtJ]) {
                continue;
            }
            
            NSMutableString *newString = [[previousString stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:stringAtJ] mutableCopy];
            newString = [[newString stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:stringAtI] mutableCopy];
            
            if (![previousResult containsObject:newString]) {
                [previousResult addObject:newString];
                recursionToFindStringWithPreviousResult(previousResult, newString);
            }
        }
    }
}

// ---------------------------

NSMutableArray * solutionIncreaseCounter(int N, NSMutableArray *A) { // 100% correct and 100% performance
    NSInteger MAX = 0, B = 0, CI;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < N; i++) {
        [result addObject:@(0)];
    }
    
    for(int i = 0; i < A.count; i++) {
        CI = [A[i] integerValue] - 1;
        if ([A[i] integerValue] <= N && [A[i] integerValue] >= 1) {
            result[CI] = @(MAX(B,[result[CI] integerValue]) + 1);
            MAX = MAX(MAX,[result[CI] integerValue]);
        } else if([A[i] integerValue] == N + 1) {
            B = MAX;
        }
    }
    
    for(int i = 0; i < result.count; i++)
        result[i] = @(MAX([result[i] integerValue],B));
    
    return result;
}

// ---------------------------

-(NSInteger)numberOfPalindromicSlices:(NSString*)string{ // 100% correct and 11% performance
    if (string.length < 2) {
        return 0;
    }
    
    NSInteger numberOfPalindromicSlices = 0;
    
    for (NSInteger i = 0; i < string.length - 1; i++) {
        for (NSInteger j = i + 1; j < string.length; j++) {
            NSString *subString = [string substringWithRange:NSMakeRange(i, j - i + 1)];
            if (isPalindrome(subString)) {
                numberOfPalindromicSlices++;
            }
        }
    }
    
    if (numberOfPalindromicSlices > 100000000) {
        return -1;
    }
    
    return numberOfPalindromicSlices;
}

BOOL isPalindrome(NSString *string) {
    NSInteger length = [string length];
    for(NSInteger i=0; i<length/2; i++){
        if ([string characterAtIndex:i] != [string characterAtIndex:(length - 1 - i)]){
            return NO;
        }
    }
    return YES;
}

// --------------------------

-(NSInteger)solutionPairsOfIntersectingDiscs:(NSArray*)numberArray{ // 100% correct and 25% performance
    NSInteger pairsOfIntersectingDiscs = 0;

    NSInteger i = 0;
    while (i < numberArray.count) {
        NSInteger maxValueOfI = i + [numberArray[i] integerValue];
        for (NSInteger j = i + 1; j < numberArray.count; j++) {
            NSInteger minValueOfJ = j - [numberArray[j] integerValue];
            if (maxValueOfI >= minValueOfJ) {
                pairsOfIntersectingDiscs ++;
            }
        }
        i++;
    }

    if (pairsOfIntersectingDiscs > 10000000) {
        return -1;
    }
    
    return pairsOfIntersectingDiscs;
}


@end
