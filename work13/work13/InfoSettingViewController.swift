//
//  InfoSettingViewController.swift
//  work13
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var indentifire = "cell"

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
        case 1:
            return 5
        case 2:
            return 4
        case 3:
            return 4
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
       // let switchView = UISwitch()
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.accessoryView = switchView
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        var content = cell.defaultContentConfiguration()
        content.text = ViewController.names[indexPath.section][indexPath.row]
        
        content.image = UIImage(named: ViewController.images[indexPath.section][indexPath.row])
        if indexPath.row == 0 && indexPath.section == 0 {
            content.imageProperties.cornerRadius = 55
            
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ViewController.names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
           return 80
        }
        return 45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = ViewController.names[indexPath.section][indexPath.row]
        print("Нажата ячейка \(info)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

