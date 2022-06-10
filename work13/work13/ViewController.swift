

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var tableOne = [
        ["Авиарежим", " Wi-Fi", "Bluetooth", "Сотовая связь"],
        ["Режим модема", "Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"]
        ]
          
    private var myImages = [["airplane", "wi-fi", "bluetooth", "diversity"],
                            ["modem", "call", "sound", "night", "time-on"]
                            ]

    let switchView = UISwitch()
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        tableView.register(UINib(nibName: "CellIndentifier", bundle: nil),
                           forCellReuseIdentifier: "CellIndentifier")
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        default:
            break
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier") else {
            fatalError()
        }
        cell.textLabel?.font = .systemFont(ofSize: 15)
        //cell.textLabel?.text = tableOne[indexPath.row][indexPath.section]
       // cell.imageView.image = myImages[indexPath.section][indexPath.row]
        
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.accessoryView = switchView
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }



     func numberOfSections(in tableView: UITableView) -> Int {
         return tableOne.count
    }

    ///вывести в консоль

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(tableOne)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



