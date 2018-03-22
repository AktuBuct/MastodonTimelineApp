//
//  DateConverterTest.swift
//  MastodonTestAppTests
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import XCTest
@testable import MastodonTestApp

class DateConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testDateFromStringConvertion() {

        let date = DateConverter.dateFrom(string: "2018-03-22T12:42:25.921Z")
        let wrongDate = DateConverter.dateFrom(string: "2018-03-22T12:42:25")

        XCTAssertNotNil(date)
        XCTAssertNil(wrongDate)
    }

    func testIntervalStringFromDate() {

        let now = DateConverter.intervalStringFrom(date: Date(timeIntervalSinceNow: -5))
        let someSeconds = DateConverter.intervalStringFrom(date: Date(timeIntervalSinceNow: -15))
        let someMinutes = DateConverter.intervalStringFrom(date: Date(timeIntervalSinceNow: -75))
        let someHours = DateConverter.intervalStringFrom(date: Date(timeIntervalSinceNow: -60*60*2))

        XCTAssertTrue(now == "now")
        XCTAssertTrue(someSeconds == "15s")
        XCTAssertTrue(someMinutes == "1m")
        XCTAssertTrue(someHours == "2h")
    }

}
