//
//  SearchGroupViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 21.10.2021.
//

import UIKit

class SearchGroupViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let reuseIndentifierMyCustom = "reuseIndentifierMyCustom"
    let searchGroupToMyGroups = "searchGroupToMyGroups"
    
    var groupsArray = [Groups]()
    var selectedGroup: Groups?
    var count = Int()
    
//    var costumCell = [Groups]()
    

    
    func groupsFillArray() {
        let groupOne = Groups(name: "Lemon", avatar: UIImage(named: "Lemon")!)
        let groupTwo = Groups(name: "Dice", avatar: UIImage(named: "Dice")!)
        let groupThree = Groups(name: "Robo", avatar: UIImage(named: "Robo")!)
        let groupFour = Groups(name: "Free", avatar: UIImage(named: "Free")!)
        let groupFive = Groups(name: "Blot", avatar: UIImage(named: "Blot")!)
        groupsArray.append(groupOne)
        groupsArray.append(groupTwo)
        groupsArray.append(groupThree)
        groupsArray.append(groupFour)
        groupsArray.append(groupFive)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsFillArray()
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifierMyCustom)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
}

extension SearchGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellFloat)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: searchGroupToMyGroups, sender: nil)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = groupsArray[indexPath.row]
        performSegue(withIdentifier: searchGroupToMyGroups, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifierMyCustom, for: indexPath) as? MyCustomTableViewCell else {
            return UITableViewCell()
        }
        cell.myGroupsCellConfigure(groups: groupsArray[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    
}

extension SearchGroupViewController: MyCusromTableViewProtocol {
    func setCurrentCount(count: Int) {
        performSegue(withIdentifier: searchGroupToMyGroups, sender: nil)
        self.count = count
    }
    
    func myCustomTableViewlikeCounterIncrement(counter: Int) {
        print(String(counter))
    }
    
    func myCustomTableViewlikeCounterDecrement(counter: Int) {
        print(String(counter))
    }
    
    
}
