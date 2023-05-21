//
//  HomeViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.viewControllers = [self]
    }

}
