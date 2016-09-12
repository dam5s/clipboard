//
//  Clipboard.swift
//  Clipboard
//
//  Created by Damien Le Berrigaud on 9/11/16.
//  Copyright © 2016 Damien Le Berrigaud. All rights reserved.
//

import Cocoa

class ClipboardHistory {

    var maxSize: Int
    var pasteBoard: NSPasteboard
    var pasteBoardHistory: Array<String> = []

    init (maxSize: Int, pasteBoard: NSPasteboard) {
        self.maxSize = maxSize
        self.pasteBoard = pasteBoard
    }

    func getItems() -> Array<String> {
        return Array(pasteBoardHistory)
    }

    @objc
    func checkPasteBoardForNewContent() {
        pasteBoard.pasteboardItems!.forEach { item in

            if let content = item.stringForType(NSPasteboardTypeString) {
                if let index = pasteBoardHistory.indexOf(content) {
                    pasteBoardHistory.removeAtIndex(index)
                }

                pasteBoardHistory.append(content)
            }
        }

        while pasteBoardHistory.count > self.maxSize {
            pasteBoardHistory.removeFirst()
        }
    }
}
