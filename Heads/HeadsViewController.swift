//
//  HeadsViewController.swift
//  Heads
//
//  Created by Sam Soffes on 8/29/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import AppKit

final class HeadsViewController: NSViewController {

	override func loadView() {
		view = NSView()
		view.wantsLayer = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let stackView = NSStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.orientation = .vertical
		stackView.spacing = 8
		stackView.wantsLayer = true

		for name in ["Sam", "Max", "Bryn"] {
			let avatar = AvatarView(image: NSImage(named: name)!)
			stackView.addArrangedSubview(avatar)
		}

		view.addSubview(stackView)

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			stackView.topAnchor.constraint(equalTo: view.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
