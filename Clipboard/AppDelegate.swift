//
//  AppDelegate.swift
//  Clipboard
//
//  Created by Damien Le Berrigaud on 9/10/16.
//  Copyright © 2016 Damien Le Berrigaud. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private let clipboardHistory = ClipboardHistory(maxSize: 10, pasteBoard: NSPasteboard.generalPasteboard())

    @IBOutlet var menu: NSMenu!

    private var statusItem: NSStatusItem! = nil
    private var timer: NSTimer! = nil
    private var historyWindowController: HistoryWindowController! = nil


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
            target: clipboardHistory,
            selector: #selector(ClipboardHistory.checkPasteBoardForNewContent),
            userInfo: nil,
            repeats: true
        )

        let storyBoard = NSStoryboard(name: "Main", bundle:nil)

        historyWindowController = storyBoard
            .instantiateControllerWithIdentifier("HistoryWindowController") as! HistoryWindowController

        let historyViewController = historyWindowController.contentViewController as! HistoryViewController
        historyViewController.clipboardHistory = clipboardHistory


        let statusBar = NSStatusBar.systemStatusBar()
        statusItem = statusBar.statusItemWithLength(NSVariableStatusItemLength)
        statusItem.image = NSImage(named: "clipboard")
        statusItem.menu = self.menu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func viewClipboard(sender: AnyObject) {
        historyWindowController.showWindow(nil)
    }

    @IBAction func quit(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
}

