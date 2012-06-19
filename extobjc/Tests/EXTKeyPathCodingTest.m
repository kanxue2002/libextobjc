//
//  EXTKeyPathCodingTest.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 19.06.12.
//
//

#import "EXTKeyPathCodingTest.h"

// used to test refactoring also updating @keypath() uses
@interface MyClass : NSObject
@property (nonatomic, assign) NSUInteger someUniqueProperty;
@end

@implementation EXTKeyPathCodingTest

- (void)testSingleKey {
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com:8080/search?q=foo"];
    STAssertNotNil(URL, @"");

    NSString *path = @keypath(URL.port);
    STAssertEqualObjects(path, @"port", @"");
}

- (void)testKeyPath {
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com:8080/search?q=foo"];
    STAssertNotNil(URL, @"");

    NSString *path = @keypath(URL.port.stringValue);
    STAssertEqualObjects(path, @"port.stringValue", @"");
}

- (void)testClassKeyPath {
    NSString *path = @keypath(NSString.class.description);
    STAssertEqualObjects(path, @"class.description", @"");
}

- (void)testMyClassKeyPath {
    MyClass *obj = [[MyClass alloc] init];

    NSString *path = @keypath(obj.someUniqueProperty);
    STAssertEqualObjects(path, @"someUniqueProperty", @"");
}

@end

@implementation MyClass
@synthesize someUniqueProperty;
@end
