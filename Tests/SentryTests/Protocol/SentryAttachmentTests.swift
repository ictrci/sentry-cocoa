import XCTest

class SentryAttachmentTests: XCTestCase {
    
    private class Fixture {
        let defaultContentType = "application/octet-stream"
        let contentType = "application/json"
        let filename = "logs.txt"
        let data = "content".data(using: .utf8)!
        let path: String
        
        init() {
            path = "path/to/\(filename)"
        }
    }
    
    private let fixture = Fixture()

    func testInitWithBytes() {
        let attachment = Attachment(data: fixture.data, filename: fixture.filename)
        
        XCTAssertEqual(fixture.data, attachment.data)
        XCTAssertEqual(fixture.filename, attachment.filename)
        XCTAssertEqual(fixture.defaultContentType, attachment.contentType)
        XCTAssertNil(attachment.path)
    }
    
    func testInitWithBytesWithContentType() {
        let attachment = Attachment(data: fixture.data, filename: fixture.filename, contentType: fixture.contentType)
    
        XCTAssertEqual(fixture.data, attachment.data)
        XCTAssertEqual(fixture.filename, attachment.filename)
        XCTAssertEqual(fixture.contentType, attachment.contentType)
        XCTAssertNil(attachment.path)
    }
    
    func testInitWithPath() {
        let attachment = Attachment(path: fixture.path)
    
        XCTAssertEqual(fixture.path, attachment.path)
        XCTAssertEqual(fixture.filename, attachment.filename)
        XCTAssertEqual(fixture.defaultContentType, attachment.contentType)
        XCTAssertNil(attachment.data)
    }
    
    func testInitWithEmptyPath() {
        let attachment = Attachment(path: "")
        
        XCTAssertEqual("", attachment.path)
        XCTAssertEqual("", attachment.filename)
        XCTAssertEqual(fixture.defaultContentType, attachment.contentType)
        XCTAssertNil(attachment.data)
    }
    
    func testInitWithFilenameAsPath() {
        let attachment = Attachment(path: fixture.filename)
    
        XCTAssertEqual(fixture.filename, attachment.path)
        XCTAssertEqual(fixture.filename, attachment.filename)
    }
    
    func testInitWithPathAndFilename() {
        let filename = "input.json"
        let attachment = Attachment(path: fixture.path, filename: filename)
    
        XCTAssertEqual(fixture.path, attachment.path)
        XCTAssertEqual(filename, attachment.filename)
        XCTAssertEqual(fixture.defaultContentType, attachment.contentType)
        XCTAssertNil(attachment.data)
    }
}
