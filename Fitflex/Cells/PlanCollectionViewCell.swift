//
//  PlanCollectionViewCell.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-20.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    var exerciseList :[ExerciseDTO] = [] {
        didSet {
            self.count.text = "\(exerciseList.count) Exercises"
            var calories = 0
            var duration = 0
            var difficultyStr = ""
            var count = 0
            for exercise in exerciseList {
                duration += exercise.durationMinutes
                calories += (exercise.caloriesBurnedPerMinute * exercise.durationMinutes)
                if (count == 0 && exercise.difficulty == "Easy") {
                    difficultyStr = "Easy"
                    count += 1
                } else if (count <= 1 && exercise.difficulty == "Intermediate") {
                    difficultyStr = "Intermediate"
                    count += 1
                } else if (count <= 2 && exercise.difficulty == "Moderate") {
                    difficultyStr = "Moderate"
                    count += 1
                }
            }
            self.duration.text = "\(duration) minutes"
            self.calories.text = "\(calories) kcal"
            self.difficulty.text = difficultyStr
        }
    }
    
    let difficulty = UILabel()
    let count = UILabel()
    let calories = UILabel()
    let duration = UILabel()
    let image = UIImageView(image: UIImage(systemName: "dumbbell")?.withRenderingMode(.alwaysTemplate))
    
    static let reuseIdentifier = "PlanCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
    
        image.tintColor = .systemGray
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        contentView.addSubview(image)
        
        let difficultyContainer = UIView()
        difficultyContainer.translatesAutoresizingMaskIntoConstraints = false
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.text = "Easy"
        difficulty.font = .preferredFont(forTextStyle: .headline)
        difficulty.textAlignment = .center
        difficultyContainer.backgroundColor = .systemBlue
        difficultyContainer.layer.cornerRadius = 10
        difficultyContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        contentView.addSubview(difficultyContainer)
        difficultyContainer.addSubview(difficulty)
        
        count.translatesAutoresizingMaskIntoConstraints = false
        count.text = "\(exerciseList.count) Exercises"
        count.font = .preferredFont(forTextStyle: .headline)
        count.textAlignment = .center
        contentView.addSubview(count)
        
        calories.translatesAutoresizingMaskIntoConstraints = false
        calories.text = "\(223) kcal"
        calories.font = .preferredFont(forTextStyle: .headline)
        calories.textAlignment = .center
        contentView.addSubview(calories)
        
        duration.translatesAutoresizingMaskIntoConstraints = false
        duration.text = "\(40) minutes"
        duration.font = .preferredFont(forTextStyle: .headline)
        duration.textAlignment = .center
        contentView.addSubview(duration)
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            difficultyContainer.topAnchor.constraint(equalTo: image.bottomAnchor),
            difficultyContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            difficulty.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: -5),
            difficulty.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 8),
            difficulty.topAnchor.constraint(equalTo: difficultyContainer.topAnchor, constant: 5),
            difficulty.bottomAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: -5),

            count.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            count.topAnchor.constraint(equalTo: difficultyContainer.bottomAnchor),

            calories.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            calories.topAnchor.constraint(equalTo: count.bottomAnchor, constant: 5),

            duration.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            duration.topAnchor.constraint(equalTo: calories.bottomAnchor, constant: 5),
        ])
    }
}
