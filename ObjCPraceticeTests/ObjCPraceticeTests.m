//
//  ObjCPraceticeTests.m
//  ObjCPraceticeTests
//
//  Created by Dinh Thanh An on 4/6/17.
//  Copyright © 2017 Dinh Thanh An. All rights reserved.
//

#import "ViewController.h"
#import <XCTest/XCTest.h>

@interface ObjCPraceticeTests : XCTestCase
@property (nonatomic) ViewController *vcToTest;
@end

@interface ViewController (Test)

-(NSInteger)solutionPairsOfIntersectingDiscs:(NSArray*)numberArray;
-(NSInteger)numberOfPalindromicSlices:(NSString*)string;
NSMutableArray * solutionIncreaseCounter(int N, NSMutableArray *A);
NSMutableArray * solutionFindString(NSString *A);
NSString * solutionBitwiseXorAllNumberBetween(NSInteger min, NSInteger max);
NSMutableArray * solutionFindCoordinatesIntersection(NSInteger x, NSInteger y, NSInteger x2, NSInteger y2, NSInteger x3, NSInteger y3, NSInteger x4, NSInteger y4);

NSInteger solutionEquilibriumIndex(NSMutableArray *A);
NSInteger solutionRakuten(int A, int B, int N) ;

NSInteger solutionMaximumAdjacentDistance(NSMutableArray *A);
@end

@implementation ObjCPraceticeTests

- (void)setUp {
    [super setUp];
    _vcToTest = [[ViewController alloc] init];
}

-(void)testSolutionMaximumAdjacentDistance{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(0), @(3), @(3), @(7), @(5), @(3), @(11), @(1), @(2)]];
    NSInteger result = solutionMaximumAdjacentDistance(array);
    NSInteger expectedResult = 7;
    XCTAssertEqual(expectedResult, result, @"testSolutionRakuten is not passed");
}

-(void)testSolutionRakuten{
    NSInteger result = solutionRakuten(3, 4, 2);
    NSInteger expectedResult = 7;
    XCTAssertEqual(expectedResult, result, @"testSolutionRakuten is not passed");
}

- (void)testSolutionEquilibriumIndex{
    NSMutableArray *numberArray = [[NSMutableArray alloc] initWithArray:@[@(-1), @(3), @(-4), @(5), @(1), @(-6), @(2), @(1)]];
    NSInteger result = solutionEquilibriumIndex(numberArray);
    NSInteger expectedResult = 1;
    XCTAssertEqual(expectedResult, result, @"testSolutionEquilibriumIndex is not passed");
}

- (void)testSolutionPairsOfIntersectingDiscs{
    NSArray *numberArray = @[@(1), @(5), @(2), @(1), @(4), @(0)];
    NSInteger result = [_vcToTest solutionPairsOfIntersectingDiscs:numberArray];
    NSInteger expectedResult = 11;
    XCTAssertEqual(expectedResult, result, @"test is not passed");
}

- (void)testSolutionNumberOfPalindromicSlices{
    NSString *testString = @"baababa";
    NSInteger result = [_vcToTest numberOfPalindromicSlices:testString];
    NSInteger expectedResult = 6;
    XCTAssertEqual(expectedResult, result, @"testSolutionNumberOfPalindromicSlices is not passed");
}

- (void)testSolutionIncreaseCounter{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(3),@(4),@(4),@(6),@(1),@(4),@(4),@(6)]];
    NSMutableArray *result = solutionIncreaseCounter(5, array);
    NSMutableArray *expectedResult = [[NSMutableArray alloc] initWithArray:@[@(4),@(4),@(4),@(4),@(4)]];
    BOOL isEqual = YES;
    for (NSInteger i = 0 ; i < 5; i++) {
        if ([result[i] integerValue] != [expectedResult[i] integerValue]) {
            isEqual = NO;
        }
    }
    XCTAssertEqual(isEqual, YES, @"testSolutionNumberOfPalindromicSlices is not passed");
}

- (void)testSolutionFindString{
    NSMutableArray *result = solutionFindString(@"1123");
}

- (void)testSolutionBitwiseXorAllNumberBetween{
    NSString *result = solutionBitwiseXorAllNumberBetween(5, 8);
}

- (void)testSolutionFindCoordinatesIntersection{
    NSMutableArray *result = solutionFindCoordinatesIntersection(1, 1, 4, 7, 4, 2, 6, 4);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
