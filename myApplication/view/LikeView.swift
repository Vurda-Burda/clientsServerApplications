//
//  LikeView.swift
//  myApplication
//
//  Created by Александр Болохов on 02.11.2021.
//

import UIKit

protocol LikeViewProtocol: AnyObject {
    func likeCounterIncrement(counter: Int)
    func likeCounterDecrement(counter: Int)
}

class LikeView: UIView {
    
    private var view: UIView?
    
    var likeButtonState = false
    var counter: Int = 0
    
    weak var delegate: LikeViewProtocol?
    
    //переопределение иниациализатора
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LikeView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {return UIView()}
        return view
        }

    private func setup() {
        view = loadFromNib()
        guard let view = view else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
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



