//
//  WindowController.swift
//  Heads
//
//  Created by Sam Soffes on 8/29/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import AppKit

final class WindowController: NSWindowController {

	// MARK: - Properties

	let avatarWindow: NSWindow = {
		let viewController = HeadsViewController()
		let window = NSWindow(contentViewController: viewController)
		window.styleMask = .borderless
		window.backgroundColor = .clear
		window.isOpaque = false
		window.hasShadow = false
		window.contentView?.wantsLayer = true
		return window
	}()


	// MARK: - NSWindowController

	override func windowDidLoad() {
		super.windowDidLoad()

		guard let mainWindow = self.window else { return }
		mainWindow.addChildWindow(avatarWindow, ordered: .above)
		layoutWindows()
	}


	// MARK: - Private

	fileprivate func layoutWindows() {
		guard let mainWindow = self.window,
			let size = avatarWindow.contentView?.bounds.size
		else { return }

		avatarWindow.setFrameOrigin(CGPoint(
			x: floor(mainWindow.frame.maxX - (size.width / 2)),
			y: floor(mainWindow.frame.maxY - size.height - 22 - 16)
		))
	}
}


extension WindowController: NSWindowDelegate {
	func windowDidMove(_ notification: Notification) {
		layoutWindows()
	}

	func windowDidResize(_ notification: Notification) {
		layoutWindows()
	}
}
