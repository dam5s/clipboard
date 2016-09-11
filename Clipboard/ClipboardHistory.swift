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
    var pasteBoardHistory: Set<String> = []

    init (maxSize: Int) {
        self.maxSize = maxSize;
        self.pasteBoard = NSPasteboard.generalPasteboard()
    }

    @objc
    func checkPasteBoardForNewContent() {
        pasteBoard.pasteboardItems!.forEach { item in
            let content = item.stringForType(NSPasteboardTypeString)

            if content != nil {
                pasteBoardHistory.insert(content!)
            }
        }

        while pasteBoardHistory.count > self.maxSize {
            pasteBoardHistory.removeFirst()
        }
    }
}
