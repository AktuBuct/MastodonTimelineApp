//
//  SVAccountModelTest.swift
//  MastodonTestAppTests
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import XCTest
@testable import MastodonTestApp

class SVAccountModelTest: XCTestCase {
    
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

    func testInit() {
        let account = SVAccountModel.accountForTest
        compare(account: account, with: SVAccountModel.accountSettingsForTest as [String : AnyObject])
    }

    private func compare(account: SVAccountModel, with dictionary: [String: AnyObject]) {

        XCTAssertEqual(account.followersCount, dictionary[SerializationKey.followersCount] as? Int)
        XCTAssertEqual(account.followingCount, dictionary[SerializationKey.followingCount] as? Int)
        XCTAssertEqual(account.statusesCount, dictionary[SerializationKey.statusesCount] as? Int)

        XCTAssertEqual(account.avatarUrl, URL(string:(dictionary[SerializationKey.avatarUrl] as? String)!))
        XCTAssertEqual(account.url, URL(string:(dictionary[SerializationKey.url] as? String)!))
        XCTAssertEqual(account.headerUrl, URL(string:(dictionary[SerializationKey.header] as? String)!))

        XCTAssertEqual(account.dateOfCreate, DateConverter.dateFrom(string: dictionary[SerializationKey.dateOfCreate] as! String))

        XCTAssertEqual(account.accountId, dictionary[SerializationKey.accountId] as? String)
        XCTAssertEqual(account.acct, dictionary[SerializationKey.acctKey] as? String)
        XCTAssertEqual(account.displayName, dictionary[SerializationKey.displayName] as? String)
        XCTAssertEqual(account.note, dictionary[SerializationKey.note] as? String)
    }
    
}

private struct SerializationKey {
    static let accountId = "id"
    static let followersCount = "followers_count"
    static let acctKey = "acct"
    static let note = "note"
    static let avatarStatic = "avatar_static"
    static let dateOfCreate = "created_at"
    static let url = "url"
    static let followingCount = "following_count"
    static let statusesCount = "statuses_count"
    static let avatarUrl = "avatar"
    static let header = "header"
    static let displayName = "display_name"
    static let locked = "locked"
    static let username = "username"
    static let headerStatistic = "header_statistic"
}

fileprivate extension SVAccountModel {

    static var accountSettingsForTest: [String: Any] {
        return [SerializationKey.accountId: "testId",
                SerializationKey.followersCount: 5,
                SerializationKey.acctKey: "testAcctKey",
                SerializationKey.note: "testNote",
                SerializationKey.avatarStatic: "testAvatarStatic",
                SerializationKey.dateOfCreate: "2018-03-22T12:42:25.921Z",
                SerializationKey.url: "testUrl",
                SerializationKey.followingCount: 6,
                SerializationKey.statusesCount: 7,
                SerializationKey.avatarUrl: "testAvatar",
                SerializationKey.header: "testHeeader",
                SerializationKey.displayName: "testDisplayName",
                SerializationKey.locked: "testLocked",
                SerializationKey.username: "testUserName",
                SerializationKey.headerStatistic: "testHeaderStatistic"] as [String : Any]
    }

    static var accountForTest: SVAccountModel {
        return SVAccountModel(serverResponce: accountSettingsForTest)
    }

}
