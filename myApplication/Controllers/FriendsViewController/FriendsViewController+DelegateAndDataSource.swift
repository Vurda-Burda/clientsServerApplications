//
//  FriendsViewController+DelegateAndDataSource.swift
//  myApplication
//
//  Created by Александр Болохов on 27.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {
    //размер картинок
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableFloat)
    }
    //переход в gallery
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromSegueFriendsToGallery, sender: arrayByLetter(searchArray: friendsArray, letterArray: searchLetterInArray(searchArray: friendsArray)[indexPath.section])[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchLetterInArray(searchArray: friendsArray).count
    }
    
    
}

//инициализация ячейки
extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(arrayByLetter(searchArray: friendsArray, letterArray: searchLetterInArray(searchArray: friendsArray)[section]))
        return arrayByLetter(searchArray: friendsArray, letterArray: searchLetterInArray(searchArray: friendsArray)[section]).count
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friendsArray.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifierMyCustom, for: indexPath) as? MyCustomTableViewCell else {
            return UITableViewCell()
        }
//        cell.myFriendsCellConfigure(friend: arrayByLetter(searchArray: friendsArray, letterArray: searchLetterInArray(searchArray: friendsArray)[indexPath.section])[indexPath.row], completion: { [weak self] myFriend in
//            guard let self = self else {return}
//            self.performSegue(withIdentifier: self.fromSegueFriendsToGallery, sender: self.arrayByLetter(searchArray: self.friendsArray, letterArray: self.searchLetterInArray(searchArray: self.friendsArray)[indexPath.section])[indexPath.row])
//
//        })
        //переход в Gallery после выполнерия анимации при клике на аватарку
        cell.myFriendsCellConfigure(friend: arrayByLetter(searchArray: friendsArray, letterArray: searchLetterInArray(searchArray: friendsArray)[indexPath.section])[indexPath.row], completion: { [weak self] myFriend in
            guard let self = self else {return}
            self.performSegue(withIdentifier: self.fromSegueFriendsToGallery, sender: myFriend)
         })
        
        return cell
    }
    
    //добаляет заголовок в cell
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(searchLetterInArray(searchArray: friendsArray))
//        print(searchLetterInArray(searchArray: friendsArray)[section])
    
        return searchLetterInArray(searchArray: friendsArray)[section].uppercased()
    }
    
    
}


