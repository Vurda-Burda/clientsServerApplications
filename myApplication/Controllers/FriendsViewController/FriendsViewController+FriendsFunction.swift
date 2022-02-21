//
//  FriendsViewController+FriendsArrayAndFunction.swift
//  myApplication
//
//  Created by Александр Болохов on 27.10.2021.
//

import UIKit

extension FriendsViewController {
    func friendsFillArray() {
        let friendOne = Friends(name: "Panda", age: 11, avatar: UIImage(named: "Panda")!, photos: [UIImage(named: "Panda")!])
        let friendTwo = Friends(name: "Minion", age: 9, avatar: UIImage(named: "Minion")!, photos: [UIImage(named: "Minion")!])
        let friendThree = Friends(name: "Gomer", age: 37, avatar: UIImage(named: "Gomer")!, photos: [UIImage(named: "Gomer")!])
        let friendFour = Friends(name: "Cat", age: 7, avatar: UIImage(named: "Cat")!, photos: [UIImage(named: "Cat")!])
        let friendFive = Friends(name: "Penguin", age: 3, avatar: UIImage(named: "Penguin")!, photos: [UIImage(named: "Penguin")!])
        friendsArray.append(friendOne)
        friendsArray.append(friendTwo)
        friendsArray.append(friendThree)
        friendsArray.append(friendFour)
        friendsArray.append(friendFive)
    }
}
