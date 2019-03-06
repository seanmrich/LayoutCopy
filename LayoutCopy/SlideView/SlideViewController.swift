import AppKit

class SlideViewController: NSObject {
    @IBOutlet weak var contentView: NSView!
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!

    @IBAction func sliderMoved(_ sender: NSSlider) {
        updateContainerView()
    }
    
    func updateContainerView() {
        containerViewWidthConstraint.constant = contentView.frame.width * CGFloat(slider.floatValue)
    }
}
