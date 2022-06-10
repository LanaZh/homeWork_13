

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIndentifier")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var tableOne = [
        ["Авиарежим", " Wi-Fi", "Bluetooth", "Сотовая связь"],
        ["Режим модема", "Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"],
        ["Основное", "Экранное время", "Универсальные настройки"]
        ]
          
    private var myImages = [["airplane", "wi-fi", "bluetooth", "diversity"],
                            ["modem", "call", "sound", "night", "time-on"],
                            ["setting", "time-on", "use"]
                            ]

    let switchView = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHierarchy()
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    private func setUpHierarchy() {
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        case 2:
            return 3
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier", for: indexPath)
         if indexPath.section == 0 && indexPath.row == 0 {
             cell.accessoryView = switchView
         } else {
             cell.accessoryType = .disclosureIndicator
         }
         
         var content = cell.defaultContentConfiguration()
         content.text = tableOne[indexPath.section][indexPath.row]
         
         content.image = UIImage(named: myImages[indexPath.section][indexPath.row])
         if indexPath.row == 0 && indexPath.section == 0 {
             content.imageProperties.cornerRadius = 55
         }
         cell.contentConfiguration = content
         return cell
     }

     func numberOfSections(in tableView: UITableView) -> Int {
         return tableOne.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 40
    }
    
    ///вывести в консоль
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(tableOne)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



