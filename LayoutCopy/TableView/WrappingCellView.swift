import AppKit

class WrappingCellView: ColorView {
    @IBOutlet weak var wrappingView: WrappingView!

    override func layout() {
        super.layout()
        wrappingView.preferredMaxLayoutWidth = wrappingView.frame.width
        super.layout()
    }
}
