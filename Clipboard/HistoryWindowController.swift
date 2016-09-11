//
//  HistoryWindowController.swift
//  Clipboard
//
//  Created by Damien Le Berrigaud on 9/10/16.
//  Copyright © 2016 Damien Le Berrigaud. All rights reserved.
//

import Cocoa

class HistoryWindowController : NSWindowController {

    override func showWindow(sender: AnyObject?) {
        self.window!.center()
        self.window!.makeKeyAndOrderFront(nil)

        super.showWindow(sender)
    }
}
