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
NSInteger solutionFindLeader(NSMutableArray *A);
NSInteger solutionFindMaximumSlice(NSMutableArray *A);
NSMutableArray * solutionFindMinimalAfterQuery(NSString *S, NSMutableArray *P, NSMutableArray *Q);
NSInteger solutionStartPositionOfMinAverageSlice(NSMutableArray *A);
NSInteger maximumBlocks(NSMutableArray *A);
NSInteger maximumFlags(NSMutableArray *A);
NSInteger numberOfK(NSMutableArray *A, NSMutableArray *B);
NSMutableArray * numberOfDiffWay(NSMutableArray *A, NSMutableArray *B);
NSInteger fibFrog(NSMutableArray *A);
NSInteger nailingPlanks(NSMutableArray *A, NSMutableArray *B, NSMutableArray *C);
NSInteger minMaxDivision(int K, int M, NSMutableArray *A);

@end

@implementation ObjCPraceticeTests

- (void)setUp {
    [super setUp];
    _vcToTest = [[ViewController alloc] init];
}

-(void)testMaxMinDivision{
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(2), @(1), @(5), @(1), @(2), @(2), @(2)]];
    NSInteger expectedResult = 6;
    NSInteger result = minMaxDivision(3, 5, A);
    XCTAssertEqual(expectedResult, result, @"testMaxMinDivision is not passed");
}

-(void)testSolutionNailingPlanks{
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(1), @(4), @(5), @(8)]];
    NSMutableArray *B = [[NSMutableArray alloc] initWithArray:@[@(4), @(5), @(9), @(10)]];
    NSMutableArray *C = [[NSMutableArray alloc] initWithArray:@[@(4), @(6), @(7), @(9), @(2)]];
    NSInteger expectedResult = 4;
    
    NSInteger result = nailingPlanks(A, B, C);
    XCTAssertEqual(expectedResult, result, @"testSolutionNailingPlanks is not passed");
}

-(void)testSolutionFibFrog{
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(0), @(0), @(0), @(1), @(1), @(0), @(1), @(0), @(0), @(0), @(0)]];
    NSInteger expectedResult = 3;
    
    NSInteger result = fibFrog(A);
    XCTAssertEqual(expectedResult, result, @"testSolutionFibFrog is not passed");
}

-(void)testSolutionNumberOfDiffWay{
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(4), @(4), @(5), @(5), @(1)]];
    NSMutableArray *B = [[NSMutableArray alloc] initWithArray:@[@(3), @(2), @(4), @(3), @(1)]];
//    NSInteger expectedResult = 1;
    
    NSMutableArray * result = numberOfDiffWay(A, B);
//    XCTAssertEqual(expectedResult, result, @"testSolutionNumberOfK is not passed");
}
    
-(void)testSolutionNumberOfK{
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(15), @(10), @(3)]];
    NSMutableArray *B = [[NSMutableArray alloc] initWithArray:@[@(75), @(30), @(5)]];
    NSInteger expectedResult = 1;
    
    NSInteger result = numberOfK(A, B);
    XCTAssertEqual(expectedResult, result, @"testSolutionNumberOfK is not passed");
}

-(void)testSolutionMaximumFlags{
    //    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(10), @(10), @(-1), @(-2), @(2), @(4), @(-1), @(2), @(-1)]];
    //    NSInteger expectedResult = 2;
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(1), @(5), @(3), @(4), @(3), @(4), @(1), @(2), @(3), @(4), @(6), @(2)]];
    NSInteger expectedResult = 3;
    
    NSInteger result = maximumFlags(A);
    XCTAssertEqual(expectedResult, result, @"testSolutionMaximumFlags is not passed");
}

-(void)testSolutionMaximumBlocks{
    //    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(10), @(10), @(-1), @(-2), @(2), @(4), @(-1), @(2), @(-1)]];
    //    NSInteger expectedResult = 2;
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(1), @(2), @(3), @(4), @(3), @(4), @(1), @(2), @(3), @(4), @(6), @(3), @(2)]];
    NSInteger expectedResult = 2;
    
    NSInteger result = maximumBlocks(A);
    XCTAssertEqual(expectedResult, result, @"testSolutionMaximumBlocks is not passed");
}

-(void)testSolutionStartPositionOfMinAverageSlice{
//    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(10), @(10), @(-1), @(-2), @(2), @(4), @(-1), @(2), @(-1)]];
//    NSInteger expectedResult = 2;
    NSMutableArray *A = [[NSMutableArray alloc] initWithArray:@[@(4), @(2), @(2), @(5), @(1), @(5), @(8)]];
    NSInteger expectedResult = 1;
    
    NSInteger result = solutionStartPositionOfMinAverageSlice(A);
    XCTAssertEqual(expectedResult, result, @"testSolutionStartPositionOfMinAverageSlice is not passed");
}

-(void)testSolutionFindMinimalAfterQuery{
    NSMutableArray *P = [[NSMutableArray alloc] initWithArray:@[@(2), @(5), @(0), @(1)]];
    NSMutableArray *Q = [[NSMutableArray alloc] initWithArray:@[@(4), @(5), @(6), @(4)]];
    
    NSMutableArray *result = solutionFindMinimalAfterQuery(@"CAGCCTA", P, Q);
//    NSInteger expectedResult = 8;
//    XCTAssertEqual(expectedResult, result, @"testSolutionFindLeader is not passed");
}

-(void)testSolutionFindMaximumSlice{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(-5), @(-7), @(3), @(5), @(-2), @(-4), @(-1)]];
    NSInteger result = solutionFindMaximumSlice(array);
    NSInteger expectedResult = 8;
    XCTAssertEqual(expectedResult, result, @"testSolutionFindLeader is not passed");
}

-(void)testSolutionFindLeader{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(6), @(8), @(4), @(6), @(8), @(6), @(6)]];
    NSInteger result = solutionFindLeader(array);
    NSInteger expectedResult = 6;
    XCTAssertEqual(expectedResult, result, @"testSolutionFindLeader is not passed");
}

-(void)testSolutionMaximumAdjacentDistance{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(0), @(3), @(3), @(7), @(5), @(3), @(11), @(1), @(2)]];
    NSInteger result = solutionMaximumAdjacentDistance(array);
    NSInteger expectedResult = 7;
    XCTAssertEqual(expectedResult, result, @"testSolutionMaximumAdjacentDistance is not passed");
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
