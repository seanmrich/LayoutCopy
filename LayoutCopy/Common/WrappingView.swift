import AppKit

let itemSize = NSSize(width: 20, height: 12)

class WrappingView: ColorView {
    var preferredMaxLayoutWidth: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    private var itemCount = 0
    override var isFlipped: Bool { return true }
    
    func setItemCount(_ count: Int) {
        itemCount = count
        while subviews.count > itemCount {
            subviews.last?.removeFromSuperview()
        }
        while subviews.count < itemCount {
            let view = ColorView(frame: NSRect(origin: .zero, size: itemSize))
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: NSSize {
        let singleLineWidth = CGFloat(itemCount) * itemSize.width
        let maxWidth = max(preferredMaxLayoutWidth, itemSize.width)
        let lineCount = (singleLineWidth / maxWidth).rounded(.up)
        let intrinsicHeight = lineCount * itemSize.height
        let intrinsicWidth = lineCount == 1 ? singleLineWidth : (preferredMaxLayoutWidth / itemSize.width).rounded(.down) * itemSize.width
        return NSSize(width: intrinsicWidth, height: intrinsicHeight)
    }
    
    override func layout() {
        super.layout()
        let layoutWidth = bounds.width
        var x: CGFloat = 0; var y: CGFloat = 0
        for subview in subviews {
            if x > layoutWidth - itemSize.width {
                y += itemSize.height
                x = 0
            }
            subview.setFrameOrigin(NSPoint(x: x, y: y))
            x += itemSize.width
        }
    }
}
