//
//  GroupsViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 21.10.2021.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIndentifierMyCustom = "reuseIndentifierMyCustom"
    let searchGroupToMyGroups = "searchGroupToMyGroups"
    
    var groupsArray = [Groups]()
    
//    func groupsFillArray() {
//        let groupOne = Groups(name: "Lemon", avatar: UIImage(named: "Lemon")!)
//        let groupTwo = Groups(name: "Dice", avatar: UIImage(named: "Dice")!)
//        let groupThree = Groups(name: "Robo", avatar: UIImage(named: "Robo")!)
//        let groupFour = Groups(name: "Free", avatar: UIImage(named: "Free")!)
//        let groupFive = Groups(name: "Blot", avatar: UIImage(named: "Blot")!)
//        groupsArray.append(groupOne)
//        groupsArray.append(groupTwo)
//        groupsArray.append(groupThree)
//        groupsArray.append(groupFour)
//        groupsArray.append(groupFive)
//
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        groupsFillArray()
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifierMyCustom)
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    //проверяет массив на наличие только уникальных элементов
    func groupIsAlreadyInArray(group: Groups) -> Bool {
        return groupsArray.contains { sourceGroup in sourceGroup.name == group.name }
    }
    
    //exit через ViewController(Segue) и добавляем cell из поиска групп
    @IBAction func exitSegueToMyCrops(segue: UIStoryboardSegue) {
        if segue.identifier == searchGroupToMyGroups,
           let sorceVC = segue.source as? SearchGroupViewController,
           let selectedGroup = sorceVC.selectedGroup
        {
            if groupIsAlreadyInArray(group: selectedGroup) {return}
            self.groupsArray.append(selectedGroup)
            tableView.reloadData()
        }
    }
    

    
}
    

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellFloat)
    }
}


extension GroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifierMyCustom, for: indexPath) as? MyCustomTableViewCell else {
            return UITableViewCell()
        }
        cell.myGroupsCellConfigure(groups: groupsArray[indexPath.row])
        
        return cell
    }
    
    
}
