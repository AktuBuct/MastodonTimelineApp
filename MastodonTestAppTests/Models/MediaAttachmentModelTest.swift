//
//  MediaAttachmentModelTest.swift
//  MastodonTestAppTests
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import XCTest
@testable import MastodonTestApp

class MediaAttachmentModelTest: XCTestCase {
    
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
        let attachment = MediaAttachmentModel.attachmentForTest
        compare(attachment: attachment, with: MediaAttachmentModel.attachmentSettingsForTest)
    }

    private func compare(attachment: MediaAttachmentModel, with dictionary: [String: AnyObject]) {

        XCTAssertEqual(attachment.type, dictionary[SerializationKey.type] as? String)
        XCTAssertEqual(attachment.url, URL(string:(dictionary[SerializationKey.url] as? String)!))
        XCTAssertEqual(attachment.previewUrl, URL(string:(dictionary[SerializationKey.previewUrl] as? String)!))
        XCTAssertEqual(attachment.remoteUrl, URL(string:(dictionary[SerializationKey.remoteUrl] as? String)!))
        XCTAssertEqual(attachment.textUrl, URL(string:(dictionary[SerializationKey.textUrl] as? String)!))
    }

}

private struct SerializationKey {
    static let attachmentId = "id"
    static let type = "type"
    static let url = "url"
    static let previewUrl = "preview_url"
    static let remoteUrl = "remote_url"
    static let textUrl = "text_url"
}

fileprivate extension MediaAttachmentModel {

    static var attachmentSettingsForTest: [String: AnyObject] {
        return [SerializationKey.attachmentId: "testId",
                SerializationKey.type: "testType",
                SerializationKey.url: "testUrl",
                SerializationKey.previewUrl: "testPreview",
                SerializationKey.remoteUrl: "testRemoteUrl",
                SerializationKey.textUrl: "testTextUrl"] as [String : AnyObject]
    }

    static var attachmentForTest: MediaAttachmentModel {
        return MediaAttachmentModel(withServerResponce: attachmentSettingsForTest)
    }
}
