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

NSMutableArray * solutionIncreaseCounter(int N, NSMutableArray *A) { // 100% correct and 40% performance
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < N; i++) {
        [result addObject:@(0)];
    }
    
    NSInteger maxValue = 0;
    for (NSInteger i = 0; i < A.count; i++) {
        if ([A[i] integerValue] <= N) {
            NSInteger modifyIndex = [A[i] integerValue] - 1;
            result[modifyIndex] = @([result[modifyIndex] integerValue] + 1);
            maxValue = maxValue < [result[modifyIndex] integerValue] ? [result[modifyIndex] integerValue] : maxValue;
        } else if ([A[i] integerValue] == N + 1){
            for(NSInteger j = 0; j < N; j++){
                result[j] = @(maxValue);
            }
        }
    }
    
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

// ------------------

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
