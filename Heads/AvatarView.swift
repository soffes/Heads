import AppKit

final class AvatarView: NSView {

	// MARK: - Initializers

	init(image: NSImage) {
		super.init(frame: CGRect(x: 0, y: 0, width: 48, height: 48))

		let rect = bounds.insetBy(dx: 2, dy: 2)
		wantsLayer = true

		if let layer = layer {
			layer.shadowColor = NSColor.black.cgColor
			layer.shadowOpacity = 0.2
			layer.shadowOffset = .zero
			layer.shadowRadius = 1
			layer.shadowPath = CGPath(ellipseIn: rect, transform: nil)
		}

		let imageView = NSImageView(frame: rect)
		imageView.image = image
		imageView.wantsLayer = true
		imageView.layer?.cornerRadius = 24
		imageView.layer?.masksToBounds = true
		addSubview(imageView)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - NSView

	override var intrinsicContentSize: NSSize {
		return CGSize(width: 48, height: 48)
	}
}
