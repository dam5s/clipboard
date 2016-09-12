//
//  ClipboardHistoryTest.swift
//  Clipboard
//
//  Created by Damien on 9/11/16.
//  Copyright © 2016 Damien Le Berrigaud. All rights reserved.
//

import XCTest
@testable import Clipboard

class ClipboardHistoryTest: XCTestCase {

    let pasteBoard = NSPasteboard(name: "Test Pasteboard")

    func testCheckPasteBoardForNewContent_InsertingUntilMaxSize() {
        let history = ClipboardHistory(maxSize: 3, pasteBoard: pasteBoard)

        XCTAssertEqual([], history.getItems())



        changePasteboardContent("Oh Hi!")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Oh Hi!"], history.getItems())



        changePasteboardContent("Hello")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Oh Hi!", "Hello"], history.getItems())


        changePasteboardContent("World!")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Oh Hi!", "Hello", "World!"], history.getItems())


        changePasteboardContent("How is it going?")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Hello", "World!", "How is it going?"], history.getItems())
    }

    func testCheckPasteBoardForNewContent_InsertingDuplicates() {
        let history = ClipboardHistory(maxSize: 10, pasteBoard: pasteBoard)

        XCTAssertEqual([], history.getItems())



        changePasteboardContent("Oh Hi!")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Oh Hi!"], history.getItems())



        changePasteboardContent("Hello")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Oh Hi!", "Hello"], history.getItems())


        changePasteboardContent("Oh Hi!")
        history.checkPasteBoardForNewContent()

        XCTAssertEqual(["Hello", "Oh Hi!"], history.getItems())
    }



    func changePasteboardContent(content: String) {
        pasteBoard.clearContents()
        pasteBoard.setString(content, forType: NSPasteboardTypeString)
    }
}