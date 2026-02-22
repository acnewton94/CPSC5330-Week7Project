import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var tableView: UITableView!

    private let items: [CoffeeItem] = [
        CoffeeItem(name: "Espresso",     price: "$2.50", details: "Strong and bold single shot."),
        CoffeeItem(name: "Americano",    price: "$3.00", details: "Espresso with hot water."),
        CoffeeItem(name: "Latte",        price: "$4.25", details: "Espresso with steamed milk."),
        CoffeeItem(name: "Cappuccino",   price: "$4.10", details: "Espresso with foamed milk."),
        CoffeeItem(name: "Mocha",        price: "$4.75", details: "Chocolate + espresso + milk."),
        CoffeeItem(name: "Cold Brew",    price: "$4.50", details: "Smooth cold-steeped coffee."),
        CoffeeItem(name: "Iced Latte",   price: "$4.50", details: "Latte served over ice."),
        CoffeeItem(name: "Matcha Latte", price: "$4.95", details: "Matcha green tea with milk."),
        CoffeeItem(name: "Chai Latte",   price: "$4.65", details: "Spiced chai with steamed milk."),
        CoffeeItem(name: "Hot Chocolate",price: "$3.75", details: "Rich cocoa, served warm.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coffee Menu"

        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Storyboard prototype cell reuse identifier MUST be "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.price

        // Optional: nice iOS look
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // If you created a SELECTION segue from the cell, do NOT call performSegue here.
        // The segue fires automatically on selection.
    }

    // MARK: - Navigation (Data Passing)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showItem",
              let destination = segue.destination as? SecondViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }

        destination.item = items[indexPath.row]
    }
}
