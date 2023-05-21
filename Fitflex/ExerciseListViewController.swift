//
//  ExerciseListViewController.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-21.
//

import UIKit

protocol ExerciseCellDelegate {
    func cellClicked(sender: ExerciseDTO)
}
class ExerciseListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ExerciseCellDelegate {
    
    var collectionView: UICollectionView! = nil
    var exerciseList :[ExerciseDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        doCollectionViewLayout()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SELECT PLAN", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(saveDataAndNavigate), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
        ])
    }
    
    func doCollectionViewLayout() {
        // https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(310))
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
        return exerciseList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.reuseIdentifier, for: indexPath) as! ExerciseCollectionViewCell
        cell.delegate = self
        cell.backgroundColor = .systemGray5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6
        cell.exercise = exerciseList[indexPath.row]
        APICalls.retrieveImage(exerciseList[indexPath.row].imageURL) {(image) in
            if let img = image {
                cell.image.contentMode = .scaleAspectFill
                cell.image.image = img
            }
        }
        return cell
    }
    
    func cellClicked(sender: ExerciseDTO) {
        //        let exerciseList = ExerciseListViewController()
        //        exerciseList.title = "Plan Details"
        //        navigationController?.pushViewController(exerciseList, animated: true)
    }
    
    @objc func saveDataAndNavigate() {
        navigationController?.pushViewController(ScheduleViewController(), animated: true)
    }
    
}
