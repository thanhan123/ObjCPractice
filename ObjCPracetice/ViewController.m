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

NSInteger maximumBlocks(NSMutableArray *A){
    NSMutableArray *peaksArray = [NSMutableArray new];
    for (NSInteger i = 1; i < A.count - 1; i++) {
        if ([A[i] integerValue] > [A[i - 1] integerValue] && [A[i] integerValue] > [A[i + 1] integerValue]) {
            [peaksArray addObject:@(i)];
        }
    }
    
    if (peaksArray.count == 0) {
        return 0;
    }
    
    for (NSInteger i = peaksArray.count; i >= 1; i++) {
        
    }
    
    return 0;
}

// ---------------------------

NSInteger solutionStartPositionOfMinAverageSlice(NSMutableArray *A) { // 100% correct and 100% performance
    NSInteger lengthMinSum = 2;
    NSInteger minSum = [A[0] integerValue] + [A[1] integerValue];
    NSInteger startPosition = 0;
    
    NSInteger observerLength = lengthMinSum, observerSum = minSum, observerStartPosition = startPosition;
    
    for (NSInteger i = 2; i < A.count; i++) {
        // increase sum value and length
        observerLength++;
        observerSum += [A[i] integerValue];
        
        // check sum larger than sum of 2 lastest element
        if (observerSum / (float)observerLength > ([A[i] integerValue] + [A[i - 1] integerValue]) / (float)2) {
            observerLength = 2;
            observerSum = [A[i] integerValue] + [A[i - 1] integerValue];
            observerStartPosition = i - 1;
        }
        
        // check min sum larger than sum
        if (minSum / (float)lengthMinSum > observerSum / (float)observerLength) {
            minSum = observerSum;
            lengthMinSum = observerLength;
            startPosition = observerStartPosition;
        }
    }
    
    return  startPosition;
}

// ---------------------------

NSMutableArray * solutionFindMinimalAfterQuery(NSString *S, NSMutableArray *P, NSMutableArray *Q) {
    NSMutableArray *result = [NSMutableArray new];
    
    NSMutableArray *genome = [[NSMutableArray alloc] initWithArray:@[[NSMutableArray new], [NSMutableArray new], [NSMutableArray new]]];
    [genome[0] addObject:@(0)];
    [genome[1] addObject:@(0)];
    [genome[2] addObject:@(0)];
    for (NSInteger i = 0; i < S.length; i++) {
        NSInteger a = 0, c = 0, g = 0; // 0 mean not existing at index i
        if ([S characterAtIndex:i] == 'A') {
            a = 1; // 1 mean existing at index i
        } else if ([S characterAtIndex:i] == 'C') {
            c = 1;
        } else if ([S characterAtIndex:i] == 'G') {
            g = 1;
        }
        
        [genome[0] addObject:@([genome[0][i] integerValue] + a)];
        [genome[1] addObject:@([genome[1][i] integerValue] + c)];
        [genome[2] addObject:@([genome[2][i] integerValue] + g)];
    }
    
    for (NSInteger i = 0; i < P.count; i++) {
        NSInteger fromIndex = [P[i] integerValue];
        NSInteger toIndex = [Q[i] integerValue] + 1;
        if ([genome[0][toIndex] integerValue] - [genome[0][fromIndex] integerValue] > 0) { // use prefix sum to check existing value in specific range
            [result addObject:@(1)];
        } else if ([genome[1][toIndex] integerValue] - [genome[1][fromIndex] integerValue] > 0) {
            [result addObject:@(2)];
        } else if ([genome[2][toIndex] integerValue] - [genome[2][fromIndex] integerValue] > 0) {
            [result addObject:@(3)];
        } else {
            [result addObject:@(4)];
        }
    }
    
    return result;
}

// ---------------------------

NSInteger solutionFindMaximumSlice(NSMutableArray *A){
    NSInteger max_ending = 0, max_slice = 0;
    for(NSNumber *a in A){
        max_ending = MAX(0, max_ending + [a integerValue]);
        max_slice = MAX(max_slice, max_ending);
    }
    
    return max_slice;
}

// ---------------------------

NSInteger solutionFindLeader(NSMutableArray *A){
    NSInteger result = -1;
    
    [A sortUsingComparator:^NSComparisonResult(NSNumber *  _Nonnull obj1, NSNumber *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSInteger countTime = 1;
    for (NSInteger i = 1; i < A.count; i++) {
        if ([A[i] integerValue] == [A[i-1] integerValue]) {
            countTime++;
            if (countTime > A.count / 2) {
                result = [A[i] integerValue];
                break;
            }
        } else {
            countTime = 1;
        }
    }
    
    return result;
}

NSInteger solutionMaximumAdjacentDistance(NSMutableArray *A){
    NSInteger result = -1;
    
    NSMutableArray *B = [NSMutableArray new];
    for (NSInteger i = 0; i < A.count; i++) {
        [B addObject:@[@([A[i] integerValue]),@(i)]];
    }
    
    [B sortUsingComparator:^NSComparisonResult(NSArray *  _Nonnull obj1, NSArray *  _Nonnull obj2) {
        NSNumber *value1 = obj1[0];
        NSNumber *value2 = obj2[0];
        return [value1 compare:value2];
    }];
    
    for (NSInteger i = 0; i < B.count - 1; i++) {
        NSInteger value1 = [B[i][0] integerValue];
        NSInteger maxValueForI = value1;
        for (NSInteger j = i + 1; j < B.count; j++) {
            NSInteger value2 = [B[j][0] integerValue];
            if (value2 > value1 && (maxValueForI == value1 || value2 <= maxValueForI)) {
                maxValueForI = value2;
                
                NSLog(@"Pair adjacent: %li - %li",[B[i][1] integerValue], [B[j][1] integerValue]);
                
                result = result < labs([B[i][1] integerValue] - [B[j][1] integerValue]) ? labs([B[i][1] integerValue] - [B[j][1] integerValue]) : result;
            }
        }
    }
    
    return result;
}

// ---------------------------

NSInteger solutionRakuten(int A, int B, int N) {
    NSInteger divided = 1000000007;
    return (fib(N)*(B%divided) + fib(N - 1)*(A%divided))%divided;
}

int fib(int num){
    if (num == 0) {
        return 0;
    }
    if (num == 1) {
        return 1;
    }
    return fib(num - 1) + fib(num - 2);
}

NSInteger solutionEquilibriumIndex(NSMutableArray *A) {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *arrayCounted = countArray(A);
    for (NSInteger i = 0; i < A.count; i++) {
        NSInteger leftValue = 0;
        NSInteger rightValue = 0;
        if (i == 0) {
            rightValue = countSegment(arrayCounted, i + 1, A.count - 1);
        } else if (i == A.count - 1) {
            leftValue = countSegment(arrayCounted, 0, A.count - 2);
        } else {
            leftValue = countSegment(arrayCounted, 0, i - 1);
            rightValue = countSegment(arrayCounted, i + 1, A.count - 1);
        }
        if (leftValue == rightValue) {
            [result addObject:@(i)];
        }
    }
    
    if (result.count > 0) {
        return [[result firstObject] integerValue];
    } else {
        return -1;
    }
}

NSMutableArray * countArray(NSMutableArray *A){
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger i = 0; i < A.count + 1; i++) {
        [result addObject:@(0)];
    }
    
    for (NSInteger i = 1; i < A.count + 1; i++) {
        result[i] = @([result[i - 1] integerValue] + [A[i - 1] integerValue]);
    }
    
    return result;
}

NSInteger countSegment(NSMutableArray *A, NSInteger from, NSInteger to){
    return [A[to + 1] integerValue] - [A[from] integerValue];
}


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

-(NSInteger)solutionPairsOfIntersectingDiscs:(NSArray*)A{ // 100% correct and 25% performance
//    NSInteger pairsOfIntersectingDiscs = 0;

//    NSInteger i = 0;
//    while (i < numberArray.count) {
//        NSInteger maxValueOfI = i + [numberArray[i] integerValue];
//        for (NSInteger j = i + 1; j < numberArray.count; j++) {
//            NSInteger minValueOfJ = j - [numberArray[j] integerValue];
//            if (maxValueOfI >= minValueOfJ) {
//                pairsOfIntersectingDiscs ++;
//            }
//        }
//        i++;
//    }
    
    NSInteger result = 0;
    NSMutableArray *dps = [NSMutableArray new];
    NSMutableArray *dpe = [NSMutableArray new];
    for (NSInteger i = 0; i < A.count; i++) {
        [dps addObject:@(0)];
        [dpe addObject:@(0)];
    }
    
    for (int i = 0; i < A.count; i++) {
        // stores the number of discs that starts at i-a[i]
        dps[MAX(0, i - [A[i] integerValue])] = @([dps[MAX(0, i - [A[i] integerValue])] integerValue] + 1);
        if (i < A.count - [A[i] integerValue])
            dpe[i + [A[i] integerValue]] = @([dpe[i + [A[i] integerValue]] integerValue] + 1); // stores the number of discs that ends at i+a[i]
    }  // dpe[Math.min(a.length - 1, i + a[i])]++; should use this
    
    NSInteger t = 0;// t is the number of discs that have started and have not ended yet
    
    for (int i = 0; i < A.count; i++) {
        if (dps[i] > 0) {// there are discs that start at this position
            // discs that started before and the discs that started just now all intersect
            result += t * [dps[i] integerValue];
            // discs that started just now also intersect with each other
            // the number of pairs is dps[i]!/(2! * dps[i]-2)!)
            result += [dps[i] integerValue] * ([dps[i] integerValue] - 1) / 2;
            if (result > 10000000) {
                return -1;
            }
            // we add the new discs to the set of discs that have started, but not ended.
            t += [dps[i] integerValue];
        }
        // At position i, there could be some discs that end,
        // and thus, we must update t by removing the discs that have ended at i.
        t -= [dpe[i] integerValue];
    }
    
    return result;
}


@end
