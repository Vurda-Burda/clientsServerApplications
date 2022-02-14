//
//  FriendsViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 21.10.2021.
//

import UIKit
//контроллер друзья
class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //Имя ячейки
    let reuseIndentifierMyCustom = "reuseIndentifierMyCustom"
    
    //имя Segue
    let fromSegueFriendsToGallery = "fromSegueFriendsToGallery"
    
    var friendsArray = [Friends]()
    var saveFriendsArray = [Friends]()
    
    
    
    //Массив первых букв
    func searchLetterInArray(searchArray: [Friends]) -> [String] {
        var res = [String]()
        for item in searchArray {
            //первый символ
            let letter = String(item.name.prefix(1))
            if !res.contains(letter.lowercased()) {
                res.append(letter.lowercased())
            }
        }
        //сортировка массива по буквам
        return res.sorted {first, second in first < second}
    }
    
    func arrayByLetter(searchArray: [Friends], letterArray: String) -> [Friends] {
        var res = [Friends]()
        for item in searchArray {
            let letter = String(item.name.prefix(1).lowercased())
            if letter == letterArray.lowercased() {
                res.append(item)
            }
        }
        return res
    }
    
    //обновление данных при переходе
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsFillArray()
        saveFriendsArray = friendsArray
        
        //подкючение ячейки
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifierMyCustom)
        //настройка tableView - cell
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    //переход
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //super.prepare(for: segue, sender: sender)
        //let sourceVC = segue.source as? FriendsViewController,
        if segue.identifier == fromSegueFriendsToGallery, let destinationVC = segue.destination as? GalleryViewController, let friend = sender as? Friends {
            
            destinationVC.galleryImages = friend.photos
        }
    }
    
}

//настройка и логика для searchBar
extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //если searchBar не пуст
        if searchText.isEmpty {
            self.friendsArray = self.saveFriendsArray
        } else {
            self.friendsArray = self.friendsArray.filter({friendItem in friendItem.name.lowercased().contains(searchText.lowercased())})
        }
        //перезагрузить таблицу
        self.tableView.reloadData()
    }
}
    

