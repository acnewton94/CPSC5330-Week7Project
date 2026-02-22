import UIKit

final class SecondViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!

    var item: CoffeeItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Details"

        nameLabel.text = item?.name ?? ""
        priceLabel.text = item?.price ?? ""
        detailsLabel.text = item?.details ?? ""
    }
}
