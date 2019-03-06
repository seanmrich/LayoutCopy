import AppKit

class TableViewController: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var tableView: NSTableView!
    
    private var data = TableViewController.randomData(1) {
        didSet {
            tableView.reloadData()
        }
    }
    
    private static func randomData(_ count: Int) -> [Int] {
        return (0..<count).map { _ in Int.random(in: 5...50) }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: cellID, owner: self) as? WrappingCellView else { return nil }
        cellView.wrappingView.setItemCount(data[row])
        return cellView
    }
}

let cellID = NSUserInterfaceItemIdentifier("EntryCell")
