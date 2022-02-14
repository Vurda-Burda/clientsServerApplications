//
//  SliderImageViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 05.11.2021.
//

import UIKit

class SliderImageViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewFromSlider: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var numberImageSlider: Int = 0
    
    let imageArray = [UIImage(named: "Minion"), UIImage(named: "Gomer"), UIImage(named: "Cat"), UIImage(named: "Penguin")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[numberImageSlider]
        self.view.backgroundColor = UIColor.black
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    @objc    func tapFunction() {
        if  numberImageSlider < imageArray.count {
            UIView.animate(withDuration: 2) { [weak self] in
                guard let self = self else {return}
                self.imageView.frame = CGRect(x: 0, y: 200, width: 0, height: 0) } completion: { _ in}
            imageView.image = imageArray[numberImageSlider]
            numberImageSlider += 1
        }
        else {
            numberImageSlider = 0
        }
        
        
    }

}
