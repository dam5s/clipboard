//
//  HistoryViewController.swift
//  Clipboard
//
//  Created by Damien Le Berrigaud on 9/10/16.
//  Copyright © 2016 Damien Le Berrigaud. All rights reserved.
//

import Cocoa

class HistoryViewController: NSViewController {

    var clipboardHistory: ClipboardHistory! = nil

    @IBOutlet var arrayController: NSArrayController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear() {
        arrayController.remove(self)
        arrayController.addObjects(clipboardHistory.getItems().reverse())
    }
}
