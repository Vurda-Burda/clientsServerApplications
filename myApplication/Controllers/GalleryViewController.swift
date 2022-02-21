//
//  GalleryViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 22.10.2021.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //уникальный идентификатор
    let reuseIndentifierMyCustomCell = "reuseIndentifierMyCustomCell"
    
//    let galleryImages = [UIImage(named: "Blot")!, UIImage(named: "Cat")!, UIImage(named: "Dice")!,  UIImage(named: "Free")!,  UIImage(named: "Gomer")!, UIImage(named: "Lemon")!,  UIImage(named: "Minion")!,  UIImage(named: "Panda")!,  UIImage(named: "Penguin")!,  UIImage(named: "Robo")!]
    
    var galleryImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //подключение ячейки
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIndentifierMyCustomCell)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        collectionView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "toSliderImageSegue", sender: nil)
    }

}

//нажатие на ячейку
extension GalleryViewController: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sliderImageSegue", sender: nil)
    }
}

//параметры ячейки
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let whiteSpace = CGFloat(14)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

//инициализация ячейки
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifierMyCustomCell, for: indexPath) as? GalleryCollectionViewCell else {return UICollectionViewCell()}
        cell.configureGalleryImage(imagePhoto: self.galleryImages[indexPath.item])
        
        return cell
        
    }
    
    
    
    
}

    
    
