//
//  StartViewController.swift
//  myApplication
//
//  Created by Александр Болохов on 12.10.2021.
//

import UIKit
//стартовый экран (enter login/ password)
class StartViewController: UIViewController {
    
    @IBOutlet weak var startView: UIView!
    
    @IBOutlet weak var startImageApplicatiom: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var entranceButton: UIButton!
    
    //Анимация загрузки
    @IBOutlet weak var aktiveIndicatorView: UIActivityIndicatorView!
    
    func addShadow(view: UIView, colorShadow: CGColor, widthShadow: Int, heightShadow: Int, radiusShadow: Int, opacityShadow: Double) {
        view.layer.shadowColor = colorShadow
        //размер
        view.layer.shadowOffset = CGSize(width: widthShadow, height: heightShadow)
        //радиус
        view.layer.shadowRadius = CGFloat(radiusShadow)
        //Прозрачность
        view.layer.shadowOpacity = Float(opacityShadow)
    }
    
    //случайные картинки для стартового экрана
    func imageFromApplication () {
        guard let url = URL(string: "https://picsum.photos/200") else {return}
        let data = try? Data(contentsOf: url)
        guard let image = UIImage(data: data!) else {return}
        
        startImageApplicatiom.image = image
        
    }
    
    //функция срабатывающая в момент загрузки экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageFromApplication()
        
        //удаление анимации через 1 секунду после загузки
        DispatchQueue.main.asyncAfter(deadline: .now() + timeAnimation) {
            self.aktiveIndicatorView.removeFromSuperview()
//            self.aktiveIndicatorView.color = UIColor.clear
        }

        //градиент
        let gradientView = CAGradientLayer()
        gradientView.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemBlue.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        gradientView.locations = [0, 0.26, 0.40, 0.54, 0.68, 0.82, 1]
        gradientView.zPosition = 0
        gradientView.startPoint = CGPoint.zero
        gradientView.endPoint = CGPoint(x: 0, y: 1)
        gradientView.frame = self.view.bounds
        self.view.layer.addSublayer(gradientView)
        
        startView.layer.zPosition = 1
        
//        //цвет
//        loginTextField.layer.shadowColor = UIColor.black.cgColor
//        //размер
//        loginTextField.layer.shadowOffset = CGSize(width: 8, height: 8)
//        //радиус
//        loginTextField.layer.shadowRadius = 6
//        //Прозрачность
//        loginTextField.layer.shadowOpacity = 0.8
        addShadow(view: loginTextField, colorShadow: UIColor.black.cgColor, widthShadow: 8, heightShadow: 8, radiusShadow: 6, opacityShadow: 0.8)
        addShadow(view: passwordTextField, colorShadow: UIColor.black.cgColor, widthShadow: 8, heightShadow: 8, radiusShadow: 6, opacityShadow: 0.8)
        addShadow(view: entranceButton, colorShadow: UIColor.black.cgColor, widthShadow: 8, heightShadow: 8, radiusShadow: 6, opacityShadow: 0.8)
        //скругление углов
        entranceButton.layer.cornerRadius = 14
    }
        
    //слушитель события на кнопке (нажатие)
    @IBAction func actionEntranceButton(_ sender: Any) {
        performSegue(withIdentifier: "toGreenScreen", sender: nil)
//        guard let login = loginTextField.text,
//              let password = passwordTextField.text
//        else { return }
//
//    if login == "test" && password == "test" {
//        loginTextField.backgroundColor = UIColor.green
//        passwordTextField.backgroundColor = UIColor.green
//        performSegue(withIdentifier: "toGreenScreen", sender: nil)
//
//    } else {
//        loginTextField.backgroundColor = UIColor.red
//        passwordTextField.backgroundColor = UIColor.red
//    }
}
}
