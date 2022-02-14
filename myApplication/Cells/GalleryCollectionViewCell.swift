//
//  GalleryCollectionViewCell.swift
//  myApplication
//
//  Created by Александр Болохов on 22.10.2021.
//

import UIKit


class GalleryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var buttonLike: UIButton!
    
    var likeButtonState = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
         self.photoImageView = nil
    }
    
    func configureGalleryImage(imagePhoto: UIImage) {
        photoImageView.image = imagePhoto
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
        if !likeButtonState {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        likeButtonState = !likeButtonState
    }
}

