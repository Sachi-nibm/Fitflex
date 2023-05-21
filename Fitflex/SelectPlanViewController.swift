//
//  SelectPlanViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-20.
//

import UIKit

protocol PlanCellDelegate {
    func cellClicked(sender: [ExerciseDTO])
}
class SelectPlanViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PlanCellDelegate {
    
    var collectionView: UICollectionView! = nil
    var selectedGoal = "Balanced"
    var exercisePlans :[[ExerciseDTO]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        let type = String(selectedGoal.prefix(1));
        APICalls.getExercices(type) {(plans) in
            if let plans = plans {
                self.exercisePlans = plans
                self.collectionView.reloadData()
            } else {
                let errorAlert = UIAlertController(
                    title: "ERROR",
                    message: "Error occurred when retrieving data. Please try again later.", preferredStyle: .alert
                )
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
        }
        
        doCollectionViewLayout()
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(PlanCollectionViewCell.self, forCellWithReuseIdentifier: PlanCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
    
    func doCollectionViewLayout() {
        // https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(280))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercisePlans.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanCollectionViewCell.reuseIdentifier, for: indexPath) as! PlanCollectionViewCell
        cell.delegate = self
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6
        cell.backgroundColor = .systemGray5
        cell.exerciseList = exercisePlans[indexPath.row]
        APICalls.retrieveImage(exercisePlans[indexPath.row][1].imageURL) {(image) in
            if let img = image {
                cell.image.contentMode = .scaleAspectFill
                cell.image.image = img
            }
        }
        return cell
    }
    
    func cellClicked(sender: [ExerciseDTO]) {
        let exerciseList = ExerciseListViewController()
        exerciseList.title = "Plan Details"
        exerciseList.exerciseList = sender
        navigationController?.pushViewController(exerciseList, animated: true)
    }
}
