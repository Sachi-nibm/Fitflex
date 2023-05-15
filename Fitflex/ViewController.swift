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
        let text = UITextField()
        text.text = "Hello World!"
        text.font = .boldSystemFont(ofSize: 30)
        text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text)
        
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
    }


}

