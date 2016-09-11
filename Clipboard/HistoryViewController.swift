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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
