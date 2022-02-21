//
//  MyCustomTableViewCell.swift
//  myApplication
//
//  Created by Александр Болохов on 21.10.2021.
//

import UIKit

protocol MyCusromTableViewProtocol: AnyObject {
    func myCustomTableViewlikeCounterIncrement(counter: Int)
    func myCustomTableViewlikeCounterDecrement(counter: Int)
    func setCurrentCount(count: Int)
}


class MyCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var likeView: LikeView!
    
    weak var delegate: MyCusromTableViewProtocol?
    
    
    var completion: ((Friends) -> Void)?
    var friend: Friends?
    
    override func prepareForReuse() {
        avatarImage.image = nil
        titleLabel.text = nil
        completion = nil
        friend = nil
    }
    
    func myFriendsCellConfigure(friend: Friends, completion: ((Friends) -> Void)?) {
        self.friend = friend
        self.completion = completion
        avatarImage.image = friend.avatar
        titleLabel.text = friend.name + " , " + " Age: \(friend.age)"
    }
    
    func myGroupsCellConfigure(groups: Groups) {
        avatarImage.image = groups.avatar
        titleLabel.text = groups.name
    }
    
    //срабатывает при инициализации ячейки
    override func awakeFromNib() {
        super.awakeFromNib()
        likeView.delegate = self
        //Panda (без этого норимально не округляется)
        avatarImage.layer.cornerRadius = 43
        //добавление тени для картинок
        backView.layer.cornerRadius = 43
        backView.layer.backgroundColor = UIColor.white.cgColor
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 8, height: 8)
        backView.layer.shadowRadius = 8
        backView.layer.shadowOpacity = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func animatiomAvatarButton(_ sender: Any) {
        let scale = CGFloat(10)
        //возвращение заданного положение
//        let frame = avatarImage.frame
        UIView.animate(withDuration: 2) { [weak self] in
            guard let self = self else {return}
            self.avatarImage.frame = CGRect(x: self.avatarImage.frame.origin.x + scale / 2, y: self.avatarImage.frame.origin.y + scale / 2, width: self.avatarImage.frame.width - scale, height: self.avatarImage.frame.height - scale)
        
        } completion: { isSuccessfully in
            UIView.animate(withDuration: 3,
                           delay: 0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.3,
                           options: []) { [weak self] in
//                self?.avatarImage.frame = frame
                self?.avatarImage.frame = CGRect(x: (self?.avatarImage.frame.origin.x)! - scale / 2  , y: (self?.avatarImage.frame.origin.y)! - scale / 2, width: (self?.avatarImage.frame.width)! + scale, height: (self?.avatarImage.frame.height)! + scale)
            } completion: { isAllSuccessFully in
                self.delegate?.setCurrentCount(count: 13)
                if isAllSuccessFully,
                   let friend = self.friend
                {
                    self.completion?(friend)
                }
            }

        }

    }
    
}

extension MyCustomTableViewCell: LikeViewProtocol {
    func likeCounterIncrement(counter: Int) {
        delegate?.myCustomTableViewlikeCounterIncrement(counter: counter)
    }
    
    func likeCounterDecrement(counter: Int) {
        delegate?.myCustomTableViewlikeCounterDecrement(counter: counter)
    }
    
    
}
