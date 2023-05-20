//
//  BasicInfoViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-16.
//

import UIKit

class BasicInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let ageInput = UITextField()
    let heightInput = UITextField()
    let weightInput = UITextField()
    let pickerInput = UITextField()
    let tip = UILabel()
    let helper = UILabel()
    
    let pickerView = UIPickerView()
    var selectedGoal: String?
    var goalList = ["Weight Loss", "Balanced", "Muscle Building"]
    
    var age :Int = 0
    var height :Double = 0
    var weight :Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
        changePickerVal(0)
        
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
        ageInput.addTarget(self, action: #selector(calcBMI), for: .editingChanged)
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
        heightInput.addTarget(self, action: #selector(calcBMI), for: .editingChanged)
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
        weightInput.addTarget(self, action: #selector(calcBMI), for: .editingChanged)
        scrollView.addSubview(weightInput)
        
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "kg"
        weightLabel.font = .preferredFont(forTextStyle: .headline)
        scrollView.addSubview(weightLabel)
        
        tip.translatesAutoresizingMaskIntoConstraints = false
        tip.text = " "
        tip.font = .preferredFont(forTextStyle: .headline)
        tip.textColor = .label
        tip.numberOfLines = 0
        tip.textAlignment = .center
        scrollView.addSubview(tip)
        
        helper.translatesAutoresizingMaskIntoConstraints = false
        helper.text = " \n\n "
        helper.font = .preferredFont(forTextStyle: .subheadline)
        helper.numberOfLines = 0
        helper.textAlignment = .center
        scrollView.addSubview(helper)
        
        pickerInput.translatesAutoresizingMaskIntoConstraints = false
        pickerInput.borderStyle = .roundedRect
        pickerInput.textAlignment = .center
        pickerInput.font = .preferredFont(forTextStyle: .headline)
        pickerInput.delegate = self
        scrollView.addSubview(pickerInput)
        
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
            
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 80),
            logo.heightAnchor.constraint(equalToConstant: 50),
            
            ageInput.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40),
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
            
            helper.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            helper.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            helper.topAnchor.constraint(equalTo: tip.bottomAnchor, constant: 20),
            
            pickerInput.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            pickerInput.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7),
            pickerInput.topAnchor.constraint(equalTo: helper.bottomAnchor, constant: 30),
            
            button.topAnchor.constraint(equalTo: pickerInput.bottomAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    @objc func validateInputAndNext() {
        let inputsValid = checkIfValid(true)
        if (!inputsValid) {
            tip.text = "please fill all fields with valid values"
            tip.textColor = .systemRed
        } else {
            let userStorage = UserDefaults.standard
            userStorage.set(age, forKey: "AGE")
            userStorage.set(height, forKey: "HEIGHT")
            userStorage.set(weight, forKey: "WEIGHT")
            userStorage.set(selectedGoal?.prefix(1), forKey: "TYPE")
            navigationController?.pushViewController(SelectPlanViewController(), animated: true)
        }
    }
    
    @objc func calcBMI() {
        let inputsValid = checkIfValid(false)
        if (inputsValid) {
            let bmi = (weight/((height/100) * (height/100)))
            var status = "";
            var helperText = "We recommend ";
            if (age >= 20) {
                if (bmi < 18.5) {
                    status = "UNDERWEIGHT"
                    helperText += "not to do any "
                    changePickerVal(2)
                } else if (bmi >= 18.5 && bmi <= 24.9) {
                    status = "HEALTHY"
                    helperText += "you to do MUSCLE BUILDING "
                    changePickerVal(2)
                } else if (bmi > 24.9 && bmi <= 29.9) {
                    status = "OVERWEIGHT"
                    helperText += "you to do BALANCED "
                    changePickerVal(1)
                } else {
                    status = "OBESE"
                    helperText += "you to do WEIGHT LOSS "
                    changePickerVal(0)
                }
            } else {
                if (bmi < 16.5) {
                    status = "UNDERWEIGHT"
                    helperText += "not to do any "
                    changePickerVal(2)
                } else if (bmi >= 16.5 && bmi < 23.1) {
                    status = "HEALTHY"
                    helperText += "you to do MUSCLE BUILDING "
                    changePickerVal(2)
                } else if (bmi >= 23.1 && bmi <= 28.1) {
                    status = "OVERWEIGHT"
                    helperText += "you to do BALANCED "
                    changePickerVal(1)
                } else {
                    status = "OBESE"
                    helperText += "you to do WEIGHT LOSS "
                    changePickerVal(0)
                }
            }
            helperText += "exercises, Alternatively you can set your own goal from the following list."
            tip.text = "BMI - \(String(format: "%.1f", bmi)) | \(status)"
            helper.text = helperText
            tip.textColor = .label
        }
    }
    
    func checkIfValid(_ showValid: Bool) -> Bool {
        var inputsValid = true;
        
        if (ageInput.text?.range(of: "^\\d+$",options: .regularExpression) != nil) {
            age = Int(ageInput.text ?? "0") ?? 0
            if (age < 4 || age >= 100) {
                if (showValid) {
                    ageInput.layer.shadowOpacity = 1
                    ageInput.shake()
                }
                inputsValid = false
            } else {
                ageInput.layer.shadowOpacity = 0
            }
        } else {
            if (showValid) {
                ageInput.layer.shadowOpacity = 1
                ageInput.shake()
            }
            inputsValid = false
        }
        
        if (heightInput.text?.range(of: "^\\d+(\\.\\d{0,})?$",options: .regularExpression) != nil) {
            height = Double(heightInput.text ?? "0") ?? 0
            if (height < 30 || height >= 260) {
                if (showValid) {
                    heightInput.layer.shadowOpacity = 1
                    heightInput.shake()
                }
                inputsValid = false
            } else {
                heightInput.layer.shadowOpacity = 0
            }
        } else {
            if (showValid) {
                heightInput.layer.shadowOpacity = 1
                heightInput.shake()
            }
            inputsValid = false
        }
        
        if (weightInput.text?.range(of: "^\\d+(\\.\\d{0,})?$",options: .regularExpression) != nil) {
            weight = Double(weightInput.text ?? "0") ?? 0
            if (weight < 2 || weight >= 500) {
                if (showValid) {
                    weightInput.layer.shadowOpacity = 1
                    weightInput.shake()
                }
                inputsValid = false
            } else {
                weightInput.layer.shadowOpacity = 0
            }
        } else {
            if (showValid) {
                weightInput.layer.shadowOpacity = 1
                weightInput.shake()
            }
            inputsValid = false
        }
        
        return inputsValid;
    }
    
    func changePickerVal(_ index : Int) {
        pickerView.selectRow(index, inComponent: 0, animated: false)
        selectedGoal = goalList[index]
        pickerInput.text = selectedGoal
    }
    
    // https://medium.com/@raj.amsarajm93/create-dropdown-using-uipickerview-4471e5c7d898
    func createPickerView() {
        pickerView.delegate = self
        pickerInput.inputView = pickerView
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), button], animated: true);
        toolBar.isUserInteractionEnabled = true
        pickerInput.inputAccessoryView = toolBar
    }
    @objc func action() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return goalList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGoal = goalList[row]
        pickerInput.text = selectedGoal
    }
    
}
