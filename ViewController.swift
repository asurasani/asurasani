//
//  ViewController.swift
//  Tutorial
//
//  Created by Aneesh Surasani on 12/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = .white
        return imageview
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Randomphoto", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    let colors: [UIColor] = [.systemPink, .systemBlue, .systemRed, .systemCyan, .systemTeal, .systemMint]
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    @objc func didTapButton(){
        getRandomphoto()
        
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        view.addSubview(imageview)
        imageview.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageview.center = view.center
        view.addSubview(button)
        
        button.frame = CGRect(x: 20, y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
        
        getRandomphoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    func getRandomphoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageview.image = UIImage(data: data)
    }


}

