//
//  ViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        let logoName = UILabel()
        logoName.text = "FitFlex"
        logoName.font = UIFont(name: "ChalkboardSE-Bold", size: 50)
        logoName.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logoName)
        
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        scrollView.addSubview(image);
        
        let text = UILabel()
        text.text = "WELCOME TO"
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        text.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(text)
        
        let tagline = UILabel()
        tagline.text = "Loose weight the right way!"
        tagline.font = UIFont.preferredFont(forTextStyle: .title3)
        tagline.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(tagline)
        
        let getStarted = UIButton()
        getStarted.translatesAutoresizingMaskIntoConstraints = false
        getStarted.setTitle("GET STARTED", for: .normal)
        getStarted.backgroundColor = .systemBlue
        getStarted.layer.cornerRadius = 25
        getStarted.addTarget(self, action: #selector(goToBasicInfo), for: .touchUpInside)
        scrollView.addSubview(getStarted)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 150),
            
            logoName.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoName.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -40),
            
            text.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            text.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            text.bottomAnchor.constraint(equalTo: logoName.topAnchor, constant: -40),
            
            tagline.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tagline.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 50),
            
            getStarted.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            getStarted.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            getStarted.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            getStarted.topAnchor.constraint(equalTo: tagline.bottomAnchor, constant: 70),
            getStarted.widthAnchor.constraint(equalToConstant: 200),
            getStarted.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func goToBasicInfo() {
        navigationController?.pushViewController(BasicInfoViewController(), animated: true)
    }

}

