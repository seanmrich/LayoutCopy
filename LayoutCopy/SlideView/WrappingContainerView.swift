import AppKit

class WrappingContainerView: ColorView {
    @IBOutlet weak var wrappingView: WrappingView!
    
    override func awakeFromNib() {
        randomizeContent()
    }
    
    @IBAction func randomizeClicked(_ sender: NSButton) {
        randomizeContent()
    }
    
    private func randomizeContent() {
        wrappingView.setItemCount(Int.random(in: 20...200))
    }
    
    override func layout() {
        super.layout()
        wrappingView.preferredMaxLayoutWidth = wrappingView.frame.width
        super.layout()
    }
}
