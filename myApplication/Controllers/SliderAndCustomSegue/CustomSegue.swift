//
//  CustomSegue.swift
//  myApplication
//
//  Created by Александр Болохов on 10.11.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
//        super.perform()
        guard let containerView = source.view.superview,
              let destinationView = destination.view,
              let sourseController = source as? GalleryViewController  else {return print("Error\(source)")}
        
        let containerViewFrame = containerView.frame
        let destinationFrame = source.view.frame
        
        containerView.addSubview(destination.view)
        
        destinationView.frame = CGRect(x: source.view.frame.width + 600, y: source.view.frame.height + 300, width: 0, height: 0)
        
        UIView.animate(withDuration: 3) {[weak self] in
            self?.source.view.frame = destinationView.frame
        } completion: {done in
            if done {
                UIView.animate(withDuration: 3) {
                    destinationView.frame = destinationFrame
                } completion: {[weak self] done in
                    if done,
                    let self = self {
                        self.source.present(self.destination, animated: false, completion: nil)
                    
                    }
                }

            }
        }

    }

}
