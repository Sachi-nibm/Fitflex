//
//  BasicInfoViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-16.
//

import UIKit

class BasicInfoViewController: UIViewController {
    
    let ageInput = UITextField()
    let heightInput = UITextField()
    let weightInput = UITextField()
    let tip = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Basic Information"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        let logo = UIImageView(image: UIImage(named: "logo"));
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        scrollView.addSubview(logo)
        
        ageInput.placeholder = "Age"
        ageInput.textAlignment = .right
        ageInput.translatesAutoresizingMaskIntoConstraints = false;
        ageInput.borderStyle = .roundedRect
        ageInput.keyboardType = .numberPad
        ageInput.layer.shadowColor = UIColor.systemRed.cgColor
        ageInput.layer.shadowOpacity = 0
        ageInput.layer.shadowOffset = .zero
        ageInput.layer.shadowRadius = 3
        scrollView.addSubview(ageInput)
        
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "years"
        ageLabel.font = .preferredFont(forTextStyle: .headline)
        scrollView.addSubview(ageLabel)
        
        heightInput.placeholder = "Height"
        heightInput.textAlignment = .right
        heightInput.translatesAutoresizingMaskIntoConstraints = false;
        heightInput.borderStyle = .roundedRect
        heightInput.keyboardType = .decimalPad
        heightInput.layer.shadowColor = UIColor.systemRed.cgColor
        heightInput.layer.shadowOpacity = 0
        heightInput.layer.shadowOffset = .zero
        heightInput.layer.shadowRadius = 3
        scrollView.addSubview(heightInput)
        
        let heightLabel = UILabel()
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.text = "cm"
        heightLabel.font = .preferredFont(forTextStyle: .headline)
        scrollView.addSubview(heightLabel)
        
        weightInput.placeholder = "Weight"
        weightInput.textAlignment = .right
        weightInput.translatesAutoresizingMaskIntoConstraints = false;
        weightInput.borderStyle = .roundedRect
        weightInput.keyboardType = .decimalPad
        weightInput.layer.shadowColor = UIColor.systemRed.cgColor
        weightInput.layer.shadowOpacity = 0
        weightInput.layer.shadowOffset = .zero
        weightInput.layer.shadowRadius = 3
        scrollView.addSubview(weightInput)
        
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "kg"
        weightLabel.font = .preferredFont(forTextStyle: .headline)
        scrollView.addSubview(weightLabel)
        
        tip.translatesAutoresizingMaskIntoConstraints = false
        tip.text = " "
        tip.font = .preferredFont(forTextStyle: .subheadline)
        tip.textColor = .systemRed
        tip.numberOfLines = 0
        tip.textAlignment = .center
        scrollView.addSubview(tip)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SELECT PLAN", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(validateInputAndNext), for: .touchUpInside)
        scrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 80),
            logo.heightAnchor.constraint(equalToConstant: 50),
            
            ageInput.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 60),
            ageInput.heightAnchor.constraint(equalToConstant: 40),
            ageInput.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -25),
            ageInput.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6),
            
            ageLabel.leftAnchor.constraint(equalTo: ageInput.rightAnchor, constant: 10),
            ageLabel.centerYAnchor.constraint(equalTo: ageInput.centerYAnchor),
            ageLabel.widthAnchor.constraint(equalToConstant: 50),
            
            heightInput.topAnchor.constraint(equalTo: ageInput.bottomAnchor, constant: 30),
            heightInput.heightAnchor.constraint(equalToConstant: 40),
            heightInput.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -25),
            heightInput.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6),
            
            heightLabel.leftAnchor.constraint(equalTo: heightInput.rightAnchor, constant: 10),
            heightLabel.centerYAnchor.constraint(equalTo: heightInput.centerYAnchor),
            heightLabel.widthAnchor.constraint(equalToConstant: 50),
            
            weightInput.topAnchor.constraint(equalTo: heightInput.bottomAnchor, constant: 30),
            weightInput.heightAnchor.constraint(equalToConstant: 40),
            weightInput.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -25),
            weightInput.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6),
            
            weightLabel.leftAnchor.constraint(equalTo: weightInput.rightAnchor, constant: 10),
            weightLabel.centerYAnchor.constraint(equalTo: weightInput.centerYAnchor),
            weightLabel.widthAnchor.constraint(equalToConstant: 50),
            
            tip.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tip.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            tip.topAnchor.constraint(equalTo: weightInput.bottomAnchor, constant: 30),
            
            button.topAnchor.constraint(equalTo: tip.bottomAnchor, constant: 100),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    @objc func validateInputAndNext() {
        var inputsValid = true;
        
        if (ageInput.text?.range(of: "^\\d+$",options: .regularExpression) != nil) {
            ageInput.layer.shadowOpacity = 0
        } else {
            ageInput.layer.shadowOpacity = 1
            ageInput.shake()
            inputsValid = false
        }
        if (heightInput.text?.range(of: "^\\d+(\\.\\d{0,})?$",options: .regularExpression) != nil) {
            heightInput.layer.shadowOpacity = 0
        } else {
            heightInput.layer.shadowOpacity = 1
            heightInput.shake()
            inputsValid = false
        }
        if (weightInput.text?.range(of: "^\\d+(\\.\\d{0,})?$",options: .regularExpression) != nil) {
            weightInput.layer.shadowOpacity = 0
        } else {
            weightInput.layer.shadowOpacity = 1
            weightInput.shake()
            inputsValid = false
        }
        
        if (inputsValid) {
            tip.text = " "
        } else {
            tip.text = "please fill all fields with valid values"
        }
    }

}
