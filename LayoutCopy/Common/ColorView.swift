import AppKit

class ColorView: NSView {
    @IBInspectable var backgroundColor = NSColor.random {
        didSet { layer?.backgroundColor = backgroundColor.cgColor }
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        setupView()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupView()
    }
    
    private func setupView() {
        wantsLayer = true
        layer?.backgroundColor = backgroundColor.cgColor
    }
}


extension NSColor {
    fileprivate static var random: NSColor {
        let colors = (0..<3).map { _ in CGFloat(Float.random(in: 0...1)) }
        let (r, g, b) = (colors[0], colors[1], colors[2])
        return NSColor(calibratedRed: r, green: g, blue: b, alpha: 1)
    }
}
