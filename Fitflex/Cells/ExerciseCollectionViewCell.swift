//
//  PlanCollectionViewCell.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-21.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {
    var delegate :ExerciseCellDelegate!
    
    var exercise :ExerciseDTO! {
        didSet {
            self.nameLabel.text = "\(exercise.name)"
            self.duration.text = "\(exercise.durationMinutes) minutes"
            self.calories.text = "\(exercise.caloriesBurnedPerMinute * exercise.durationMinutes) kcal"
            self.difficulty.text = exercise.difficulty
            if (exercise.category.prefix(1) != "F") {
                specialContainer.layer.opacity = 0
            }
        }
    }
    
    let specialContainer = UIView()
    let difficulty = UILabel()
    let nameLabel = UILabel()
    let calories = UILabel()
    let duration = UILabel()
    let image = UIImageView(image: UIImage(systemName: "dumbbell")?.withRenderingMode(.alwaysTemplate))
    
    static let reuseIdentifier = "ExerciseCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
        var tapGesture: UITapGestureRecognizer!
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellClicked))
        contentView.addGestureRecognizer(tapGesture)
    
        image.tintColor = .systemGray
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        
        specialContainer.translatesAutoresizingMaskIntoConstraints = false
        let specialText = UILabel()
        specialText.translatesAutoresizingMaskIntoConstraints = false
        specialText.text = "Warm Up"
        specialText.font = .preferredFont(forTextStyle: .headline)
        specialText.textAlignment = .center
        specialContainer.backgroundColor = .systemPink
        specialContainer.layer.cornerRadius = 10
        specialContainer.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        contentView.addSubview(specialContainer)
        specialContainer.addSubview(specialText)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "NAME"
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.adjustsFontForContentSizeCategory = true
        contentView.addSubview(nameLabel)
        
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
            
            specialContainer.topAnchor.constraint(equalTo: image.bottomAnchor),
            specialContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            
            specialText.rightAnchor.constraint(equalTo: specialContainer.rightAnchor, constant: -8),
            specialText.leftAnchor.constraint(equalTo: specialContainer.leftAnchor, constant: 5),
            specialText.topAnchor.constraint(equalTo: specialContainer.topAnchor, constant: 5),
            specialText.bottomAnchor.constraint(equalTo: specialContainer.bottomAnchor, constant: -5),

            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.topAnchor.constraint(equalTo: difficultyContainer.bottomAnchor),

            calories.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            calories.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            duration.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            duration.topAnchor.constraint(equalTo: calories.bottomAnchor, constant: 5),
        ])
    }
    
    @objc func cellClicked() {
        delegate.cellClicked(sender: exercise)
    }
}
