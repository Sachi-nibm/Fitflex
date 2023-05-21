//
//  ScheduleViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-21.
//

import UIKit

class ScheduleViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var monday :UISwitch!
    var tuesday :UISwitch!
    var wednesday :UISwitch!
    var thursday :UISwitch!
    var friday :UISwitch!
    var saturday :UISwitch!
    var sunday :UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Create Schedule"
        
        monday = self.getSwitcher()
        tuesday = self.getSwitcher()
        wednesday = self.getSwitcher()
        thursday = self.getSwitcher()
        friday = self.getSwitcher()
        saturday = self.getSwitcher()
        sunday = self.getSwitcher()
        
        let mondayContainer = UIView()
        let mondayLabel = getLabel("Monday")
        mondayContainer.translatesAutoresizingMaskIntoConstraints = false
        mondayContainer.addSubview(monday)
        mondayContainer.addSubview(mondayLabel)
        view.addSubview(mondayContainer)
        
        let tuesdayContainer = UIView()
        let tuesdayLabel = getLabel("Tuesday")
        tuesdayContainer.translatesAutoresizingMaskIntoConstraints = false
        tuesdayContainer.addSubview(tuesday)
        tuesdayContainer.addSubview(tuesdayLabel)
        view.addSubview(tuesdayContainer)
        
        let wednesdayContainer = UIView()
        let wednesdayLabel = getLabel("Wednesday")
        wednesdayContainer.translatesAutoresizingMaskIntoConstraints = false
        wednesdayContainer.addSubview(wednesday)
        wednesdayContainer.addSubview(wednesdayLabel)
        view.addSubview(wednesdayContainer)
        
        let thursdayContainer = UIView()
        let thursdayLabel = getLabel("Thursday")
        thursdayContainer.translatesAutoresizingMaskIntoConstraints = false
        thursdayContainer.addSubview(thursday)
        thursdayContainer.addSubview(thursdayLabel)
        view.addSubview(thursdayContainer)
        
        let fridayContainer = UIView()
        let fridayLabel = getLabel("Friday")
        fridayContainer.translatesAutoresizingMaskIntoConstraints = false
        fridayContainer.addSubview(friday)
        fridayContainer.addSubview(fridayLabel)
        view.addSubview(fridayContainer)
        
        let saturdayContainer = UIView()
        let saturdayLabel = getLabel("Saturday")
        saturdayContainer.translatesAutoresizingMaskIntoConstraints = false
        saturdayContainer.addSubview(saturday)
        saturdayContainer.addSubview(saturdayLabel)
        view.addSubview(saturdayContainer)
        
        let sundayContainer = UIView()
        let sundayLabel = getLabel("Sunday")
        sundayContainer.translatesAutoresizingMaskIntoConstraints = false
        sundayContainer.addSubview(sunday)
        sundayContainer.addSubview(sundayLabel)
        view.addSubview(sundayContainer)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test Notification", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        //button.backgroundColor = .systemBlue
        //button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(testNotification), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            mondayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            monday.leftAnchor.constraint(equalTo: mondayContainer.leftAnchor),
            monday.topAnchor.constraint(equalTo: mondayContainer.topAnchor),
            monday.bottomAnchor.constraint(equalTo: mondayContainer.bottomAnchor),
            mondayLabel.leftAnchor.constraint(equalTo: monday.rightAnchor, constant: 10),
            mondayLabel.rightAnchor.constraint(equalTo: mondayContainer.rightAnchor),
            mondayLabel.centerYAnchor.constraint(equalTo: mondayContainer.centerYAnchor),
            
            tuesdayContainer.topAnchor.constraint(equalTo: mondayContainer.bottomAnchor, constant: 5),
            tuesdayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            tuesday.leftAnchor.constraint(equalTo: tuesdayContainer.leftAnchor),
            tuesday.topAnchor.constraint(equalTo: tuesdayContainer.topAnchor),
            tuesday.bottomAnchor.constraint(equalTo: tuesdayContainer.bottomAnchor),
            tuesdayLabel.leftAnchor.constraint(equalTo: tuesday.rightAnchor, constant: 10),
            tuesdayLabel.rightAnchor.constraint(equalTo: tuesdayContainer.rightAnchor),
            tuesdayLabel.centerYAnchor.constraint(equalTo: tuesdayContainer.centerYAnchor),
            
            wednesdayContainer.topAnchor.constraint(equalTo: tuesdayContainer.bottomAnchor, constant: 5),
            wednesdayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            wednesday.leftAnchor.constraint(equalTo: wednesdayContainer.leftAnchor),
            wednesday.topAnchor.constraint(equalTo: wednesdayContainer.topAnchor),
            wednesday.bottomAnchor.constraint(equalTo: wednesdayContainer.bottomAnchor),
            wednesdayLabel.leftAnchor.constraint(equalTo: wednesday.rightAnchor, constant: 10),
            wednesdayLabel.rightAnchor.constraint(equalTo: wednesdayContainer.rightAnchor),
            wednesdayLabel.centerYAnchor.constraint(equalTo: wednesdayContainer.centerYAnchor),
            
            thursdayContainer.topAnchor.constraint(equalTo: wednesdayContainer.bottomAnchor, constant: 5),
            thursdayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            thursday.leftAnchor.constraint(equalTo: thursdayContainer.leftAnchor),
            thursday.topAnchor.constraint(equalTo: thursdayContainer.topAnchor),
            thursday.bottomAnchor.constraint(equalTo: thursdayContainer.bottomAnchor),
            thursdayLabel.leftAnchor.constraint(equalTo: thursday.rightAnchor, constant: 10),
            thursdayLabel.rightAnchor.constraint(equalTo: thursdayContainer.rightAnchor),
            thursdayLabel.centerYAnchor.constraint(equalTo: thursdayContainer.centerYAnchor),
            
            fridayContainer.topAnchor.constraint(equalTo: thursdayContainer.bottomAnchor, constant: 5),
            fridayContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fridayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            friday.leftAnchor.constraint(equalTo: fridayContainer.leftAnchor),
            friday.topAnchor.constraint(equalTo: fridayContainer.topAnchor),
            friday.bottomAnchor.constraint(equalTo: fridayContainer.bottomAnchor),
            fridayLabel.leftAnchor.constraint(equalTo: friday.rightAnchor, constant: 10),
            fridayLabel.rightAnchor.constraint(equalTo: fridayContainer.rightAnchor),
            fridayLabel.centerYAnchor.constraint(equalTo: fridayContainer.centerYAnchor),
            
            saturdayContainer.topAnchor.constraint(equalTo: fridayContainer.bottomAnchor, constant: 5),
            saturdayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            saturday.leftAnchor.constraint(equalTo: saturdayContainer.leftAnchor),
            saturday.topAnchor.constraint(equalTo: saturdayContainer.topAnchor),
            saturday.bottomAnchor.constraint(equalTo: saturdayContainer.bottomAnchor),
            saturdayLabel.leftAnchor.constraint(equalTo: saturday.rightAnchor, constant: 10),
            saturdayLabel.rightAnchor.constraint(equalTo: saturdayContainer.rightAnchor),
            saturdayLabel.centerYAnchor.constraint(equalTo: saturdayContainer.centerYAnchor),
            
            sundayContainer.topAnchor.constraint(equalTo: saturdayContainer.bottomAnchor, constant: 5),
            sundayContainer.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            sunday.leftAnchor.constraint(equalTo: sundayContainer.leftAnchor),
            sunday.topAnchor.constraint(equalTo: sundayContainer.topAnchor),
            sunday.bottomAnchor.constraint(equalTo: sundayContainer.bottomAnchor),
            sundayLabel.leftAnchor.constraint(equalTo: sunday.rightAnchor, constant: 10),
            sundayLabel.rightAnchor.constraint(equalTo: sundayContainer.rightAnchor),
            sundayLabel.centerYAnchor.constraint(equalTo: sundayContainer.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: sundayLabel.bottomAnchor, constant: 30)
        ])
        
    }
    
    func getSwitcher() -> UISwitch {
        let daySwitch = UISwitch(frame:CGRect(x: 150, y: 300, width: 0, height: 0))
        daySwitch.translatesAutoresizingMaskIntoConstraints = false
        daySwitch.isOn = true
        daySwitch.setOn(true, animated: false)
        //daySwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
        return daySwitch;
    }
    
    func getLabel(_ dayName :String) -> UILabel {
        let label = UILabel()
        label.text = dayName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        return label;
    }
    
    @objc func testNotification() {
        // https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if error == nil {
                print("User permission is granted : \(granted)")
                if (!granted) {
                    DispatchQueue.main.async {
                        let errorAlert = UIAlertController(
                            title: "ERROR",
                            message: "Notification permissions are not granted.", preferredStyle: .alert
                        )
                        errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(errorAlert, animated: true, completion: nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    let errorAlert = UIAlertController(
                        title: "ERROR",
                        message: "Notification permissions are not granted.", preferredStyle: .alert
                    )
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
        //        Step-2 Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "FitFlex"
        content.body = "Notification Works!"
        
        //        Step-3 Create the notification trigger
        let date = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //       Step-4 Create a request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        //      Step-5 Register with Notification Center
        center.add(request) { error in
            if (error != nil) {
                DispatchQueue.main.async {
                    let errorAlert = UIAlertController(
                        title: "ERROR",
                        message: "Error occurred when displaying notification.", preferredStyle: .alert
                    )
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
    
}
